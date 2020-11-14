package top.upstudy.crm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.pojo.CustomerContact;
import top.upstudy.crm.mapper.CustomerContactMapper;
import top.upstudy.crm.pojo.CustomerLinkman;
import top.upstudy.crm.query.CustomerContactQuery;
import top.upstudy.crm.service.CustomerContactService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.utils.AssertUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-11-01
 */
@Service
public class CustomerContactServiceImpl extends ServiceImpl<CustomerContactMapper, CustomerContact> implements CustomerContactService {

    @Resource
    private CustomerContactMapper customerContactMapper;

    //查询交往记录
    public Map<String, Object> selectAll(CustomerContactQuery customerContactQuery) {
        Map<String,Object> map=new HashMap<String,Object>();
        PageHelper.startPage(customerContactQuery.getPage(),customerContactQuery.getLimit());
        PageInfo<CustomerContact> pageInfo=new PageInfo<CustomerContact>(customerContactMapper.selectAll(customerContactQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }

    //添加交往记录
    public  void saveCustomerContact(CustomerContact customerContact){
        customerContact.setIsValid(1);
        customerContact.setCreateDate(new Date());
        customerContact.setUpdateDate(new Date());
        //添加数据
        AssertUtil.isTrue(customerContactMapper.insert(customerContact) < 1,"交往记录添加失败!");
    }

    //更新交往记录
    public  void updateCustomerContact(CustomerContact customerContact){
        customerContact.setUpdateDate(new Date());
        AssertUtil.isTrue(customerContactMapper.updateById(customerContact) < 1,"交往记录更新失败!");
    }

    //删除交往记录
    public void deleteCustomerContact(Integer id){
        CustomerContact customerContact = customerContactMapper.selectById(id);
        AssertUtil.isTrue(null == customerContact,"待删除的客户记录不存在!");
        AssertUtil.isTrue(customerContactMapper.deleteById(customerContact) < 1,"客户记录删除失败!");
    }

}
