package top.upstudy.crm.controller;


import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import top.upstudy.base.BaseController;
import top.upstudy.base.ResultInfo;
import top.upstudy.crm.annotations.RequirePermission;
import top.upstudy.crm.pojo.SaleChance;
import top.upstudy.crm.query.SaleChanceQuery;
import top.upstudy.crm.service.SaleChanceService;
import top.upstudy.crm.service.UserService;
import top.upstudy.crm.utils.LoginUserUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Weder
 * @since 2020-10-17
 */
@Controller
@RequestMapping("sale_chance")
public class SaleChanceController extends BaseController {

    @Resource
    private SaleChanceService saleChanceService;

    @Resource
    private UserService userService;

    @ApiOperation("营销机会列表")
    @GetMapping("list")
    @RequirePermission(code = "101001")
    @ResponseBody
    //通过传入参数查询营销机会,考虑到与开发计划共用该查询接口，增加了flag标记（标记为开发计划查询），通过（request）获得当前用户id
    public Map<String,Object> querySaleChanceByParams(Integer flag,HttpServletRequest request,SaleChanceQuery saleChanceQuery) {
        if(flag != null && flag == 1){
            // 查询分配给指定用户的机会数据
            saleChanceQuery.setAssignMan(LoginUserUtil.releaseUserIdFromCookie(request));
        }
        return saleChanceService.querySaleChanceByParams(saleChanceQuery);
    }

    @ApiOperation("营销机会页")
    @GetMapping("index")
    @RequirePermission(code = "1010")
    public String index(){
        return "saleChance/sale_chance";
    }


    @ApiOperation("新增营销机会")
    @PostMapping("save")
    @RequirePermission(code = "101002")
    @ResponseBody
    public ResultInfo saveSaleChance(HttpServletRequest request, SaleChance saleChance){
        //通过Cookie获取id
        int userId = LoginUserUtil.releaseUserIdFromCookie(request);
        //通过id获取创建者真实姓名
        String trueName = userService.getById(userId).getTrueName();
        //写入创建者真实姓名
        saleChance.setCreateMan(trueName);
        //保存记录
        saleChanceService.saveSaleChance(saleChance);
        return success("机会数据添加成功");
    }


    @ApiOperation("转发到更新或添加营销机会页面")
    @GetMapping("addOrUpdateSaleChancePage")
    public String addOrUpdateSaleChancePage(Integer id, Model model){
        if(null != id){
            model.addAttribute("saleChance",saleChanceService.getById(id));
        }
        return "saleChance/add_update";
    }


    @ApiOperation("更新内容")
    @PostMapping("update")
    @RequirePermission(code = "101004")
    @ResponseBody
    public ResultInfo updateSaleChance(SaleChance saleChance){
        saleChanceService.updateSaleChance(saleChance);
        return success("机会数据更新成功");
    }

    @ApiOperation("删除记录")
    @PostMapping("delete")
    @RequirePermission(code = "101003")
    @ResponseBody
    public ResultInfo deleteSaleChance(Integer[] ids){
        saleChanceService.deleteSaleChance(ids);
        return success("机会数据删除成功!");
    }



    @ApiOperation("更新开发状态")
    @PostMapping("updateSaleChanceDevResult")
    @ResponseBody
    public ResultInfo updateSaleChanceDevResult(Integer id,Integer devResult){
        saleChanceService.updateSaleChanceDevResult(id,devResult);
        return success("开发状态更新成功");
    }



}
