package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-10-26
 */
public interface RoleMapper extends BaseMapper<Role> {

    //查找用户角色
    public List<Map<String,Object>> queryAllRoles(Integer userId);

    //多条件查询
    public List<Role> selectByParams(BaseQuery baseQuery) throws DataAccessException;
}
