package top.upstudy.crm.service;

import top.upstudy.crm.pojo.CustomerOrder;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.pojo.CustomerOrderQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
public interface CustomerOrderService extends IService<CustomerOrder> {

    //查询所有订单
    public Map<String,Object> queryCustomerOrdersByParams(CustomerOrderQuery customerOrderQueryQuery);

    //查询单个订单
    public Map<String,Object> queryCustomerOrderByOrderId(Integer orderId);
}
