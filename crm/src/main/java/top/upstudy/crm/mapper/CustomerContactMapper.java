package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.pojo.CustomerContact;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-11-01
 */
public interface CustomerContactMapper extends BaseMapper<CustomerContact> {

    //多条件查询
    public List<CustomerContact> selectAll(BaseQuery baseQuery) throws DataAccessException;

}
