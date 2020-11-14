package top.upstudy.crm.service;

import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.pojo.CustomerContact;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.CustomerContactQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-11-01
 */
public interface CustomerContactService extends IService<CustomerContact> {

    //查询所有交往记录
    public Map<String, Object> selectAll(CustomerContactQuery customerContactQuery);

    //添加用户
    public  void saveCustomerContact(CustomerContact customerContact);

    //更新用户
    public  void updateCustomerContact(CustomerContact customerContact);

    //删除用户
    public void deleteCustomerContact(Integer id);


}
