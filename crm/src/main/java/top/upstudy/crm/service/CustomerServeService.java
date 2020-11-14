package top.upstudy.crm.service;

import top.upstudy.crm.pojo.CustomerServe;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.CustomerServeQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-11-11
 */
public interface CustomerServeService extends IService<CustomerServe> {

    //查询客户服务
    public Map<String,Object> queryCustomerServesByParams(CustomerServeQuery customerServeQuery);

    //添加服务
    public void saveCustomerServe(CustomerServe customerServe);

    //更新服务进程
    public void updateCustomerServe(CustomerServe customerServe);
}
