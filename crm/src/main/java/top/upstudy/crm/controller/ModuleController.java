package top.upstudy.crm.controller;


import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import top.upstudy.base.BaseController;
import top.upstudy.base.ResultInfo;
import top.upstudy.crm.pojo.Module;
import top.upstudy.crm.service.ModuleService;
import top.upstudy.crm.vo.ZTree;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Weder
 * @since 2020-10-29
 */
@Controller
@RequestMapping("/module")
public class ModuleController extends BaseController {

    @Resource
    private ModuleService moduleService;


    @ApiOperation("菜单管理模块")
    @GetMapping("index")
    public String index(){
        return "module/module";
    }

    @ApiOperation("查询传入id查询角色")
    @PostMapping("queryAllModules")
    @ResponseBody
    public List<ZTree> queryAllModules(Integer roleId){
        return moduleService.queryAllModules(roleId);
    }


    @ApiOperation("获取所有菜单")
    @GetMapping("list")
    @ResponseBody
    public Map<String,Object> queryModules(){
        return moduleService.queryModules();
    }


    @ApiOperation("添加菜单")
    @PostMapping("save")
    @ResponseBody
    public ResultInfo saveModule(Module module){
        moduleService.saveModule(module);
        return success("菜单添加成功");
    }

    @ApiOperation("更新菜单")
    @PostMapping("update")
    @ResponseBody
    public ResultInfo updateModule(Module module){
        moduleService.updateModule(module);
        return success("菜单更新成功");
    }

    @ApiOperation("删除菜单")
    @PostMapping("delete")
    @ResponseBody
    public ResultInfo deleteModule(Integer mid){
        moduleService.deleteModule(mid);
        return success("菜单删除成功");
    }


    @ApiOperation("添加菜单展示页面")
    @GetMapping("addModulePage")
    public String addModulePage(Integer grade, Integer parentId, Model model){
        model.addAttribute("grade",grade);
        model.addAttribute("parentId",parentId);
        return "module/add";
    }


    @ApiOperation("更新菜单展示页面")
    @GetMapping("updateModulePage")
    public  String updateModulePage(Integer id, Model model){
        model.addAttribute("module",moduleService.getById(id));
        return "module/update";
    }

}
