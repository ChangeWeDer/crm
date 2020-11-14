package top.upstudy.crm.service;

import top.upstudy.crm.pojo.OrderDetails;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.OrderDetailsQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
public interface OrderDetailsService extends IService<OrderDetails> {

    //查询订单记录
    public Map<String,Object> queryOrderDetailsByParams(OrderDetailsQuery orderDetailsQuery);
}
