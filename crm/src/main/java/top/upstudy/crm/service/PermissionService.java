package top.upstudy.crm.service;

import top.upstudy.crm.pojo.Permission;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-29
 */
public interface PermissionService extends IService<Permission> {

    //通过用户id查询权限
    List<String> queryUserHasRoleIdsHasModuleIds(Integer userId);
}
