package top.upstudy.crm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import top.upstudy.crm.mapper.CustomerLinkmanMapper;
import top.upstudy.crm.mapper.CustomerLossMapper;
import top.upstudy.crm.mapper.CustomerOrderMapper;
import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.mapper.CustomerMapper;
import top.upstudy.crm.pojo.CustomerLinkman;
import top.upstudy.crm.pojo.CustomerLoss;
import top.upstudy.crm.pojo.CustomerOrder;
import top.upstudy.crm.query.CustomerQuery;
import top.upstudy.crm.service.CustomerLossService;
import top.upstudy.crm.service.CustomerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.utils.AssertUtil;
import top.upstudy.crm.utils.PhoneUtil;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements CustomerService {

    @Resource
    private CustomerMapper customerMapper;

    @Resource
    private CustomerLinkmanMapper customerLinkmanMapper;

    @Resource
    private CustomerLossService customerLossService;

    @Resource
    private CustomerOrderMapper customerOrderMapper;

    //通过参数查询用户
    public Map<String,Object> queryCustomersByParams(CustomerQuery customerQuery){
        Map<String,Object> map=new HashMap<String,Object>();
        PageHelper.startPage(customerQuery.getPage(),customerQuery.getLimit());
        PageInfo<Customer> pageInfo=new PageInfo<Customer>(customerMapper.selectByParams(customerQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }

    //添加用户
    public  void saveCustomer(Customer customer){
        /**
         *   参数校验
         *      客户级别不为空
         *     客户名称  name 非空 不可重复
         *     phone 联系电话  非空 格式合法
         *     法人  legal_person 非空
         */
        AssertUtil.isTrue(StringUtils.isBlank(customer.getLevel()),"请指定客户级别!");
        checkParams(customer.getName(),customer.getPhone(),customer.getLegalPerson());
        AssertUtil.isTrue(null != customerMapper.selectOne(new QueryWrapper<Customer>().eq("name",customer.getName())),"该客户已存在!");

        /**
         * 参数默认值
         *     isValid
         *     createDate
         *     updateDate
         *     state  流失状态  1-未流失 0-已流失
         */
        customer.setIsValid(1);
        customer.setCreateDate(new Date());
        customer.setUpdateDate(new Date());
        customer.setState(1);

        // 设置客户编号(当前时间（微妙）+ 0-10000内的一个随机数)
        String customerId ="KH"+ System.currentTimeMillis() + new Random().nextInt(10000) ;
        customer.setCustomerId(customerId);
        //添加数据
        AssertUtil.isTrue(customerMapper.insert(customer) < 1,"客户记录添加失败!");

        //初始化用户联系人t_customer_linkman
        CustomerLinkman customerLinkman = new CustomerLinkman();
        customerLinkman.setCusId(customer.getId());
        customerLinkman.setCreateDate(new Date());
        AssertUtil.isTrue(customerLinkmanMapper.insert(customerLinkman) < 1,"客户联系人添加失败!");

    }

    //参数校验
    private void checkParams(String name, String phone, String legalPerson) {
        AssertUtil.isTrue(StringUtils.isBlank(name),"请指定客户名称!");
        AssertUtil.isTrue(!(PhoneUtil.isMobile(phone)),"手机号格式非法!");
        AssertUtil.isTrue(StringUtils.isBlank(legalPerson),"请指定公司法人!");
    }


    //更新用户
    public  void updateCustomer(Customer customer){

        //参数校验
        checkParams(customer.getName(),customer.getPhone(),customer.getLegalPerson());
        //查找是否存在
        Customer temp = customerMapper.selectById(customer.getId());
        AssertUtil.isTrue(null == temp,"待更新的客户记录不存在!");
        //名字不允许重复
        temp = customerMapper.selectOne(new QueryWrapper<Customer>().eq("name",customer.getName()));
        AssertUtil.isTrue(null != temp && !(temp.getId().equals(customer.getId())),"该客户已存在!");
        customer.setUpdateDate(new Date());

        AssertUtil.isTrue(customerMapper.updateById(customer) < 1,"客户记录更新失败!");
    }

    //删除用户
    public void deleteCustomer(Integer id) {
        Customer customer = customerMapper.selectById(id);
        AssertUtil.isTrue(null == customer,"待删除的客户记录不存在!");
        AssertUtil.isTrue(customerMapper.deleteById(customer) < 1,"客户记录删除失败!");
        //删除从表t_customer_link中的信息
        //查找是否存在
        CustomerLinkman temp = customerLinkmanMapper.selectOne(new QueryWrapper<CustomerLinkman>().eq("cus_id", id));
        //删除
        customerLinkmanMapper.deleteById(temp.getId());
    }

    //通过定时任务添加流失客户
    public void updateCustomerState(){
        /**
         * 查询待流失的客户数据
         * 将流失的客户数据批量化添加到客户流失表中
         * 批量更新客户流失状态
         * 通过定时任务 定时流转流失客户数据到客户流失表中
         */
        List<Customer> customers = customerMapper.queryLossCustomers();
        if(null != customers && customers.size() > 0){
            List<CustomerLoss> customerLosses = new ArrayList<CustomerLoss>();
            List<Integer> lossCusIds=new ArrayList<Integer>();
            //遍历整个查找到的流失用户
            customers.forEach(c->{
                CustomerLoss customerLoss = new CustomerLoss();
                // 1-暂缓流失状态   0-确认流失状态
                customerLoss.setState(1);
                customerLoss.setCreateDate(new Date());
                customerLoss.setCusManager(c.getCusManager());
                customerLoss.setCusName(c.getName());
                customerLoss.setCusNo(c.getCustomerId());
                customerLoss.setIsValid(1);
                customerLoss.setUpdateDate(new Date());
                CustomerOrder customerOrder = customerOrderMapper.queryLastCustomerOrderByCusId(c.getId());
                if(null != customerOrder){
                    customerLoss.setLastOrderTime(customerOrder.getOrderDate());
                }
                customerLosses.add(customerLoss);
                //更新用户的流失状态
                lossCusIds.add(c.getId());
            });
            //System.out.println("==========================="+lossCusIds);
            AssertUtil.isTrue(!(customerLossService.saveBatch(customerLosses)),"客户数据流转失败!");
            AssertUtil.isTrue(customerMapper.updateCustomerStateByIds(lossCusIds)!=lossCusIds.size(),"客户数据流转失败!");
        }
    }


    //查询客户贡献
    public Map<String,Object> queryCustomerContributionByParams(CustomerQuery customerQuery){
        Map<String,Object> map=new HashMap<String,Object>();
        PageHelper.startPage(customerQuery.getPage(),customerQuery.getLimit());
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(customerMapper.queryCustomerContributionByParams(customerQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }

    //获取数据显示在echarts折线图上
    public Map<String,Object> countCustomerMake(){
        Map<String,Object> result = new HashMap<String,Object>();
        List<Map<String,Object>> list= customerMapper.countCustomerMake();
        List<String> data1=new ArrayList<String>();
        List<Integer> data2=new ArrayList<Integer>();
        /**
         * result
         *    data1:["大客户","合作伙伴"]
         *    data2:[10,20]
         */
        list.forEach(m->{
            data1.add(m.get("level").toString());
            data2.add(Integer.parseInt(m.get("total").toString()));
        });
        result.put("data1",data1);
        result.put("data2",data2);
        return result;
    }


    //获取数据显示在echarts玫瑰图上
    public Map<String,Object> countCustomerMake02(){
        Map<String,Object> result = new HashMap<String,Object>();
        List<Map<String,Object>> list= customerMapper.countCustomerMake();
        List<String> data1=new ArrayList<String>();
        List<Map<String,Object>> data2=new ArrayList<Map<String,Object>>();
        list.forEach(m->{
            data1.add(m.get("level").toString());
            Map<String,Object> temp=new HashMap<String,Object>();
            temp.put("name",m.get("level"));
            temp.put("value",m.get("total"));
            data2.add(temp);
        });
        result.put("data1",data1);
        result.put("data2",data2);
        return result;
    }

    //获取数据显示在echarts折线图上
    public Map<String,Object> countCustomerServe(){
        Map<String,Object> result = new HashMap<String,Object>();
        List<Map<String,Object>> list = customerMapper.countCustomerServe();
        List<String> data1 = new ArrayList<String>();
        List<Integer> data2 = new ArrayList<Integer>();
        /**
         * result
         *    data1:["建议","投诉"]
         *    data2:[1,2]
         */
        list.forEach(m->{
            data1.add(m.get("data_dic_value").toString());
            data2.add(Integer.parseInt(m.get("total").toString()));
        });
        result.put("data1",data1);
        result.put("data2",data2);
        return result;
    }


    //获取数据显示在echarts玫瑰图上
    public Map<String,Object> countCustomerServe02(){
        Map<String,Object> result = new HashMap<String,Object>();
        List<Map<String,Object>> list = customerMapper.countCustomerServe();
        List<String> data1 = new ArrayList<String>();
        List<Map<String,Object>> data2 = new ArrayList<Map<String,Object>>();
        list.forEach(m->{
            data1.add(m.get("data_dic_value").toString());
            Map<String,Object> temp=new HashMap<String,Object>();
            temp.put("name",m.get("data_dic_value"));
            temp.put("value",m.get("total"));
            data2.add(temp);
        });
        result.put("data1",data1);
        result.put("data2",data2);
        return result;
    }
}
