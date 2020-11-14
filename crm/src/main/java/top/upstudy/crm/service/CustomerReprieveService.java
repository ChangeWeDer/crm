package top.upstudy.crm.service;

import top.upstudy.crm.pojo.CustomerReprieve;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.CustomerReprQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-11-10
 */
public interface CustomerReprieveService extends IService<CustomerReprieve> {

    //查询暂缓数据
    public Map<String,Object> queryCustomerReprsByParams(CustomerReprQuery customerReprQuery);

    //添加暂缓数据
    public void saveCustomerRepr(CustomerReprieve customerReprieve);

    //更新暂缓数据
    public void updateCustomerRepr(CustomerReprieve customerReprieve);

    //删除暂缓数据
    public void deleteCustomerRepr(Integer id);
}
