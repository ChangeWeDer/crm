package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.CustomerLoss;
import top.upstudy.crm.pojo.CustomerReprieve;
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
public interface CustomerReprieveMapper extends BaseMapper<CustomerReprieve> {

    //多条件查询
    public List<CustomerReprieve> selectByParams(BaseQuery baseQuery) throws DataAccessException;

}
