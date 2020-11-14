package top.upstudy.crm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import top.upstudy.crm.mapper.ModuleMapper;
import top.upstudy.crm.mapper.PermissionMapper;
import top.upstudy.crm.mapper.UserRoleMapper;
import top.upstudy.crm.pojo.Permission;
import top.upstudy.crm.pojo.Role;
import top.upstudy.crm.mapper.RoleMapper;
import top.upstudy.crm.pojo.UserRole;
import top.upstudy.crm.query.RoleQuery;
import top.upstudy.crm.service.PermissionService;
import top.upstudy.crm.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.utils.AssertUtil;

import javax.annotation.Resource;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-10-26
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private UserRoleMapper userRoleMapper;

    @Resource
    private PermissionMapper permissionMapper;

    @Resource
    private PermissionService permissionService;

    @Resource
    private ModuleMapper moduleMapper;

    //查询所有角色
    public List<Map<String, Object>> queryAllRoles(Integer userId) {
        return roleMapper.queryAllRoles(userId);
    }

    //通过传入条件查询角色
    public Map<String,Object> queryRolesByParams(RoleQuery roleQuery){
        Map<String,Object> map=new HashMap<String,Object>();
        //分页
        PageHelper.startPage(roleQuery.getPage(),roleQuery.getLimit());
        PageInfo<Role> pageInfo=new PageInfo<Role>(roleMapper.selectByParams(roleQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }

    //添加角色
    public  void saveRole(Role role){
        //参数校验
        AssertUtil.isTrue(StringUtils.isBlank(role.getRoleName()),"请输入角色名称!");
        //mybatis-plus的条件构造器（所有与role_name字段相等的项）
        QueryWrapper<Role> wrapper = new QueryWrapper<Role>().eq("role_name", role.getRoleName());
        AssertUtil.isTrue(null != roleMapper.selectOne(wrapper),"该角色已存在!");
        //初始化角色数据
        role.setIsValid(1);
        role.setCreateDate(new Date());
        role.setUpdateDate(new Date());
        //添加角色
        AssertUtil.isTrue(roleMapper.insert(role) < 1,"角色记录添加失败!");
    }

    public  void updateRole(Role role){
        //参数校验
        AssertUtil.isTrue(StringUtils.isBlank(role.getRoleName()),"请输入角色名称!");
        //mybatis-plus的条件构造器（所有与role_name字段相等的项）
        QueryWrapper<Role> wrapper = new QueryWrapper<Role>().eq("role_name", role.getRoleName());
        //查询角色
        Role temp = roleMapper.selectOne(wrapper);
        //角色存在，但是传入的id与数据库中该角色的id值一致，则是已存在
        AssertUtil.isTrue(null != temp && !(temp.getId().equals(role.getId())) ,"该角色已存在!");
        //传入更新时间
        role.setUpdateDate(new Date());
        AssertUtil.isTrue(roleMapper.updateById(role) < 1,"角色记录更新失败!");
    }

    //删除角色
    public void deleteRole(Integer roleId){
        //查询角色是否存在
        Role role = roleMapper.selectById(roleId);
        AssertUtil.isTrue(null == role,"待删除的记录不存在!");

        //mybatis-plus的条件构造器（所有与role_id字段相等的项）
        QueryWrapper<UserRole> wrapper = new QueryWrapper<UserRole>().eq("role_id",roleId);
        int total =userRoleMapper.selectCount(wrapper);
        //如果关联表中中有记录，先删除中间表中的数据
        if(total > 0){
            //直接删除中间表t_user_role中的关联数据
            AssertUtil.isTrue(userRoleMapper.delete(wrapper) != total,"用户角色记录删除失败!");
        }
        //System.out.println(role);
        //使用mybatis-plus中的逻辑删除 is_valid = 0
        AssertUtil.isTrue(roleMapper.deleteById(roleId) < 1,"角色记录删除失败!");
    }

    /**
     * 角色授权
     * @param mids
     * @param roleId
     */
    public void addGrant(Integer[] mids, Integer roleId) {
        //mybatis-plus的条件构造器（所有与role_id字段相等的项）
        QueryWrapper<Permission> wrapper = new QueryWrapper<Permission>().eq("role_id",roleId);
        int total = permissionMapper.selectCount(wrapper);
        //如果关联表中中有记录，先删除中间表中的数据
        if(total > 0){
            AssertUtil.isTrue(permissionMapper.delete(wrapper) != total,"角色授权失败!");
        }

        //如果有传入权限值 则进行辅助操作
        if(null != mids && mids.length > 0){
            //接收所有权限对象
            List<Permission> permissions = new ArrayList<Permission>();
            for(Integer mid : mids){
                Permission permission = new Permission();
                permission.setCreateDate(new Date());
                permission.setModuleId(mid);
                permission.setRoleId(roleId);
                permission.setUpdateDate(new Date());
                //权限值
                permission.setAclValue(moduleMapper.selectById(mid).getOptValue());
                //添加到集合中
                permissions.add(permission);
            }
            //批量添加到权限表中
            AssertUtil.isTrue(!(permissionService.saveBatch(permissions)),"角色授权失败!");
        }
    }
}
