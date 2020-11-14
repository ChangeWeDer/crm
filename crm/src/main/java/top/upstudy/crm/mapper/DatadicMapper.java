package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.Datadic;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.upstudy.crm.pojo.SaleChance;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-11-12
 */
public interface DatadicMapper extends BaseMapper<Datadic> {

    //多条件查询
    public List<Datadic> selectByParams(BaseQuery baseQuery) throws DataAccessException;

}
