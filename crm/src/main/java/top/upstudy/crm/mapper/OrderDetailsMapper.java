package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.CusDevPlan;
import top.upstudy.crm.pojo.OrderDetails;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
public interface OrderDetailsMapper extends BaseMapper<OrderDetails> {

    //多条件查询
    public List<OrderDetails> selectByParams(BaseQuery baseQuery) throws DataAccessException;

}
