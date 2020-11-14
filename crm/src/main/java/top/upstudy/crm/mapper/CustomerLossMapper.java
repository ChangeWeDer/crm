package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.CusDevPlan;
import top.upstudy.crm.pojo.CustomerLoss;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-11-10
 */
public interface CustomerLossMapper extends BaseMapper<CustomerLoss> {

    //多条件查询
    public List<CustomerLoss> selectByParams(BaseQuery baseQuery) throws DataAccessException;


}
