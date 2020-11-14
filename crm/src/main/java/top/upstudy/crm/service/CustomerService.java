package top.upstudy.crm.service;

import top.upstudy.crm.pojo.Customer;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.CustomerQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
public interface CustomerService extends IService<Customer> {

    //通过参数查询客户
    public Map<String,Object> queryCustomersByParams(CustomerQuery customerQuery);

    //添加用户
    public  void saveCustomer(Customer customer);

    //更新用户
    public  void updateCustomer(Customer customer);

    //删除用户
    public void deleteCustomer(Integer id);

    //通过定时任务添加流失客户
    public void updateCustomerState();

    //查询客户贡献
    public Map<String,Object> queryCustomerContributionByParams(CustomerQuery customerQuery);

    //获取数据显示在echarts折线图上
    public Map<String,Object> countCustomerMake();

    //获取数据显示在echarts玫瑰图上
    public Map<String,Object> countCustomerMake02();

    //获取数据显示在echarts折线图上
    public Map<String,Object> countCustomerServe();

    //获取数据显示在echarts玫瑰图上
    public Map<String,Object> countCustomerServe02();
}
