package top.upstudy.crm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import top.upstudy.base.BaseController;
import top.upstudy.base.ResultInfo;
import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.pojo.CustomerContact;
import top.upstudy.crm.pojo.CustomerLinkman;
import top.upstudy.crm.query.CustomerQuery;
import top.upstudy.crm.service.CustomerContactService;
import top.upstudy.crm.service.CustomerLinkmanService;
import top.upstudy.crm.service.CustomerOrderService;
import top.upstudy.crm.service.CustomerService;

import javax.annotation.Resource;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

    @Resource
    private CustomerService customerService;

    //客户联系人
    @Resource
    private CustomerLinkmanService customerLinkmanService;

    @Resource
    private CustomerOrderService customerOrderService;

    @GetMapping("index")
    public String index(){
        return "customer/customer";
    }


    @ApiOperation("客户列表")
    @GetMapping("list")
    @ResponseBody
    public Map<String,Object> queryCustomersByParams(CustomerQuery customerQuery){
        return customerService.queryCustomersByParams(customerQuery);
    }

    @ApiOperation("添加客户")
    @PostMapping("save")
    @ResponseBody
    public ResultInfo saveCustomer(Customer customer){
        customerService.saveCustomer(customer);
        return  success("客户记录添加成功!");
    }

    @ApiOperation("更新客户")
    @PostMapping("update")
    @ResponseBody
    public ResultInfo updateCustomer(Customer customer){
        customerService.updateCustomer(customer);
        return  success("客户记录更新成功!");
    }


    @ApiOperation("添加或更新界面")
    @GetMapping("addOrUpdateCustomerPage")
    public String addOrUpdateCustomerPage(Integer id, Model model){
        model.addAttribute("customer",customerService.getById(id));
        //System.out.println(customerService.getById(id));
        return "customer/add_update";
    }

    @ApiOperation("联系人管理")
    @GetMapping("linkCustomerPage")
    public String linkCustomerPage(Integer cid, Model model){
        model.addAttribute("customer",customerLinkmanService.getOne(new QueryWrapper<CustomerLinkman>().eq("cus_id",cid)));
        //System.out.println(customerLinkmanService.getOne(new QueryWrapper<CustomerLinkman>().eq("cus_id",cid)));
        return "customer/customer_link";
    }

    @ApiOperation("联系人修改")
    @PostMapping("updateCustomerLinkman")
    @ResponseBody
    public ResultInfo updateCustomerLinkman(CustomerLinkman customerLinkman){
        //System.out.println(customerLinkman);
        customerLinkmanService.updateCustomerLinkman(customerLinkman);
        return success("联系人信息修改成功");
    }

    @ApiOperation("删除记录")
    @PostMapping("delete")
    @ResponseBody
    public ResultInfo deleteCustomer(Integer id){
        customerService.deleteCustomer(id);
        return success("客户记录删除成功!");
    }

    @ApiOperation("顾客订单")
    @GetMapping("orderInfoPage")
    public String orderInfoPage(Integer cid, Model model){
        model.addAttribute("customer",customerService.getById(cid));
        return "customer/customer_order";
    }


    @ApiOperation("顾客订单详情")
    @GetMapping("orderDetailPage")
    public String orderDetailPage(Integer orderId,Model model){
        model.addAttribute("order",customerOrderService.queryCustomerOrderByOrderId(orderId));
        return "customer/customer_order_detail";
    }

    @ApiOperation("查询客户贡献")
    @GetMapping("queryCustomerContributionByParams")
    @ResponseBody
    public Map<String,Object> queryCustomerContributionByParams(CustomerQuery customerQuery){
        return customerService.queryCustomerContributionByParams(customerQuery);
    }

    @ApiOperation("客户构成曲线图")
    @PostMapping("countCustomerMake")
    @ResponseBody
    public Map<String,Object> countCustomerMake(){
        return customerService.countCustomerMake();
    }

    @ApiOperation("客户构成玫瑰图")
    @PostMapping("countCustomerMake02")
    @ResponseBody
    public Map<String,Object> countCustomerMake02(){
        return customerService.countCustomerMake02();
    }

    @ApiOperation("客户服务曲线图")
    @PostMapping("countCustomerServe")
    @ResponseBody
    public Map<String,Object> countCustomerServe(){
        return customerService.countCustomerServe();
    }

    @ApiOperation("客户服务玫瑰图")
    @PostMapping("countCustomerServe02")
    @ResponseBody
    public Map<String,Object> countCustomerServe02(){
        return customerService.countCustomerServe02();
    }

}
