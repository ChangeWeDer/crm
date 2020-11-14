package top.upstudy.crm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import top.upstudy.crm.enums.CustomerServeStatus;
import top.upstudy.crm.mapper.CustomerMapper;
import top.upstudy.crm.mapper.UserMapper;
import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.pojo.CustomerServe;
import top.upstudy.crm.mapper.CustomerServeMapper;
import top.upstudy.crm.query.CustomerServeQuery;
import top.upstudy.crm.service.CustomerServeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.utils.AssertUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-11-11
 */
@Service
public class CustomerServeServiceImpl extends ServiceImpl<CustomerServeMapper, CustomerServe> implements CustomerServeService {

    @Resource
    private CustomerMapper customerMapper;

    @Resource
    private CustomerServeMapper customerServeMapper;

    @Resource
    private UserMapper userMapper;

    //查询客户服务
    public Map<String,Object> queryCustomerServesByParams(CustomerServeQuery customerServeQuery){
        Map<String,Object> map=new HashMap<String,Object>();
        PageHelper.startPage(customerServeQuery.getPage(),customerServeQuery.getLimit());
        PageInfo<CustomerServe> pageInfo=new PageInfo<CustomerServe>(customerServeMapper.selectByParams(customerServeQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }


    //添加服务
    public void saveCustomerServe(CustomerServe customerServe){
        /**
         * 1.参数校验
         *    客户名  非空  客户记录在客户表中必须存在
         *    服务类型  非空
         *    服务请求内容非空  serviceRequest
         *2. 默认值添加
         *      state  已创建 状态
         *      isValid  createDate  updateDate
         * 3.执行添加  判断结果
         */
        AssertUtil.isTrue(StringUtils.isBlank(customerServe.getCustomer()),"请指定客户!");
        AssertUtil.isTrue(StringUtils.isBlank(customerServe.getServeType()),"请指定服务类型!");
        AssertUtil.isTrue(StringUtils.isBlank(customerServe.getServiceRequest()),"请指定服务请求内容!");
        AssertUtil.isTrue(null == customerMapper.selectOne(new QueryWrapper<Customer>().eq("name",customerServe.getCustomer()).eq("state",1)),"客户记录不存在!");
        customerServe.setState(CustomerServeStatus.CREATED.getState());
        customerServe.setIsValid(1);
        customerServe.setCreateDate(new Date());
        customerServe.setUpdateDate(new Date());
        AssertUtil.isTrue(customerServeMapper.insert(customerServe) < 1,"客户服务记录创建失败!");
    }



    //更新服务进程
    public void updateCustomerServe(CustomerServe customerServe){
        /**
         * 1.参数校验
         *     id 记录必须存在
         * 2.如果状态为分配状态 fw_002
         *    分配人必须存在
         *    设置服务更新时间
         *    设置分配时间
         * 3.如果状态为 服务处理  fw_003
         *     服务处理内容非空
         *     设置服务处理时间
         *     服务更新时间
         * 4.如果服务状态为反馈状态 fw_004
         *     反馈内容非空
         *     满意度非空
         *     更新时间
         *     设置服务状态为归档状态
         * 5.执行更新操作 判断结果
         */
        AssertUtil.isTrue(null == customerServeMapper.selectById(customerServe.getId()),"待更新的服务记录不存在!");
        if(customerServe.getState().equals(CustomerServeStatus.ASSIGNED.getState())){
            // 执行分配
            AssertUtil.isTrue(null == userMapper.selectById(Integer.parseInt(customerServe.getAssigner())),"待分配的用户不存在!");
            customerServe.setAssignTime(new Date());
        }else if(customerServe.getState().equals(CustomerServeStatus.PROCED.getState())){
            AssertUtil.isTrue(StringUtils.isBlank(customerServe.getServiceProce()),"请指定处理内容!");
            customerServe.setServiceProceTime(new Date());
        }else if(customerServe.getState().equals(CustomerServeStatus.FEED_BACK.getState())){
            AssertUtil.isTrue(StringUtils.isBlank(customerServe.getServiceProceResult()),"请指定反馈内容!");
            AssertUtil.isTrue(StringUtils.isBlank(customerServe.getSatisfaction()),"请指定满意度!");
            customerServe.setState(CustomerServeStatus.ARCHIVED.getState());
        }
        customerServe.setUpdateDate(new Date());
        AssertUtil.isTrue(customerServeMapper.updateById(customerServe)<1,"服务记录更新失败!");
    }
}
