package top.upstudy.crm.controller;


import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import top.upstudy.base.BaseController;
import top.upstudy.base.ResultInfo;
import top.upstudy.crm.pojo.Role;
import top.upstudy.crm.query.RoleQuery;
import top.upstudy.crm.service.RoleService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Weder
 * @since 2020-10-26
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Resource
    private RoleService roleService;

    @ApiOperation("角色管理页")
    @GetMapping("index")
    public String index(){
        return "role/role";
    }


    @ApiOperation("查询所有角色")
    @PostMapping("queryAllRoles")
    @ResponseBody
    public List<Map<String,Object>> queryAllRoles(Integer userId){
        return roleService.queryAllRoles(userId);
    }


    @ApiOperation("查询角色")
    @GetMapping("list")
    @ResponseBody
    public Map<String,Object> queryRolesByParams(RoleQuery roleQuery){
        return roleService.queryRolesByParams(roleQuery);
    }

    @ApiOperation("添加角色")
    @PostMapping("save")
    @ResponseBody
    public ResultInfo saveRole(Role role){
        roleService.saveRole(role);
        return success("角色记录添加成功");
    }

    @ApiOperation("更新角色")
    @PostMapping("update")
    @ResponseBody
    public ResultInfo updateRole(Role role){
        roleService.updateRole(role);
        return success("角色记录更新成功");
    }


    @ApiOperation("添加或者更新角色弹出框")
    @GetMapping("addOrUpdateRolePage")
    public  String addOrUpdateRolePage(Integer id, Model model){
        model.addAttribute("role",roleService.getById(id));
        return "role/add_update";
    }

    @ApiOperation("删除角色")
    @PostMapping("delete")
    @ResponseBody
    public ResultInfo deleteRole(Integer id){
        roleService.deleteRole(id);
        return success("角色记录删除成功");
    }

    @ApiOperation("为角色授权页")
    @GetMapping("toAddGrantPage")
    public String toAddGrantPage(Integer roleId,Model model){
        model.addAttribute("roleId",roleId);
        return "role/grant";
    }

    @ApiOperation("授权接口")
    @PostMapping("addGrant")
    @ResponseBody
    public  ResultInfo addGrant(Integer[] mids,Integer roleId){
        roleService.addGrant(mids,roleId);
        return success("角色授权成功!");
    }
}
