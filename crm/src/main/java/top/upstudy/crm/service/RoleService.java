package top.upstudy.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import top.upstudy.crm.pojo.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.RoleQuery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-26
 */
public interface RoleService extends IService<Role> {

    //查找用户角色
    public List<Map<String,Object>> queryAllRoles(Integer userId);

    //通过传入条件查询角色
    public Map<String,Object> queryRolesByParams(RoleQuery roleQuery);

    //添加角色
    public void saveRole(Role role);

    //更新角色
    public void updateRole(Role role);

    //删除角色
    public void deleteRole(Integer id);

    //角色授权（mids：资源id ，roleId：角色id）
    public void addGrant(Integer[] mids, Integer roleId);
}
