package top.upstudy.crm.service;

import top.upstudy.crm.pojo.CustomerLoss;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.CustomerLossQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-11-10
 */
public interface CustomerLossService extends IService<CustomerLoss> {

    //查询流失数据
    public Map<String,Object> queryCustomerLossByParams(CustomerLossQuery customerLossQuery);

    //更新流失顾客
    public void updateCustomerLossStateById(Integer id, String lossReason);
}
