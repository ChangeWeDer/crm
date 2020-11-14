package top.upstudy.crm.service.impl;

import top.upstudy.crm.pojo.Permission;
import top.upstudy.crm.mapper.PermissionMapper;
import top.upstudy.crm.service.PermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-10-29
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {


    @Resource
    private PermissionMapper permissionMapper;

    //通过传入用户id查询该用户被授权的资源
    public List<String> queryUserHasRoleIdsHasModuleIds(Integer userId) {
        return  permissionMapper.queryUserHasRoleIdsHasModuleIds(userId);
    }

}
