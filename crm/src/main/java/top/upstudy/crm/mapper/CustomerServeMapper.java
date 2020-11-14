package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.CustomerReprieve;
import top.upstudy.crm.pojo.CustomerServe;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-11-11
 */
public interface CustomerServeMapper extends BaseMapper<CustomerServe> {

    //多条件查询
    public List<CustomerServe> selectByParams(BaseQuery baseQuery) throws DataAccessException;

}
