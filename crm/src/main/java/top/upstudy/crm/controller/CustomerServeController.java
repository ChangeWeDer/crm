package top.upstudy.crm.controller;


import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import top.upstudy.base.BaseController;
import top.upstudy.base.ResultInfo;
import top.upstudy.crm.pojo.CustomerServe;
import top.upstudy.crm.query.CustomerServeQuery;
import top.upstudy.crm.service.CustomerServeService;
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
 * @since 2020-11-11
 */
@Controller
@RequestMapping("customer_serve")
public class CustomerServeController extends BaseController {

    @Resource
    private CustomerServeService customerServeService;


    @ApiOperation("分发页面")
    @GetMapping("index/{type}")
    public String index(@PathVariable Integer type){
        if(null !=type){
            if(type == 1){
                return "customerServe/customer_serve";
            }else if(type == 2){
                return "customerServe/customer_serve_assign";
            }else if(type == 3){
                return "customerServe/customer_serve_proce";
            } else if(type == 4){
                return "customerServe/customer_serve_feed_back";
            }else if(type == 5){
                return "customerServe/customer_serve_archive";
            } else{
                return "";
            }
        }else {
            return "";
        }
    }


    @ApiOperation("查询客户服务")
    @GetMapping("list")
    @ResponseBody
    public Map<String,Object> queryCustomerServesByParams(Integer flag, HttpServletRequest request, CustomerServeQuery customerServeQuery){
        if(null != flag && flag == 1){
            // 按照分配人执行查询
            customerServeQuery.setAssigner(LoginUserUtil.releaseUserIdFromCookie(request));
        }
        return  customerServeService.queryCustomerServesByParams(customerServeQuery);
    }




    @ApiOperation("添加客户服务记录")
    @PostMapping("save")
    @ResponseBody
    public ResultInfo saveCustomerServe(CustomerServe customerServe){
        customerServeService.saveCustomerServe(customerServe);
        return success("客户服务记录创建成功");
    }

    @ApiOperation("添加记录页面")
    @GetMapping("addCustomerServePage")
    public String addCustomerServePage(){
        return "customerServe/customer_serve_add";
    }


    @ApiOperation("更新客户记录")
    @PostMapping("update")
    @ResponseBody
    public ResultInfo updateCustomerServe(CustomerServe customerServe){
        customerServeService.updateCustomerServe(customerServe);
        return success("客户服务记录更新成功");
    }

    @ApiOperation("添加分配记录页面")
    @GetMapping("addCustomerServeAssignPage")
    public String addCustomerServeAssignPage(Integer id, Model model){
        model.addAttribute("customerServe",customerServeService.getById(id));
        return "customerServe/customer_serve_assign_add";
    }

    @ApiOperation("添加处理记录页面")
    @GetMapping("addCustomerServeProcePage")
    public String addCustomerServeProcePage(Integer id, Model model){
        model.addAttribute("customerServe",customerServeService.getById(id));
        return "customerServe/customer_serve_proce_add";
    }

    @ApiOperation("添加反馈记录页面")
    @GetMapping("addCustomerServeBackPage")
    public String addCustomerServeBackPage(Integer id, Model model){
        model.addAttribute("customerServe",customerServeService.getById(id));
        return "customerServe/customer_serve_feed_back_add";
    }

}
