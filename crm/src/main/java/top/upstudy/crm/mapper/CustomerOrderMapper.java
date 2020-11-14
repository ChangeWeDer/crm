package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.pojo.CustomerOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
public interface CustomerOrderMapper extends BaseMapper<CustomerOrder> {

    //多条件查询
    public List<CustomerOrder> selectByParams(BaseQuery baseQuery) throws DataAccessException;

    //查询所有订单
    Map<String, Object> queryCustomerOrderByOrderId(Integer orderId);

    //查询单个订单
    public CustomerOrder  queryLastCustomerOrderByCusId(Integer cusId);

}
