package top.upstudy.crm.controller;


import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import top.upstudy.base.BaseController;
import top.upstudy.crm.pojo.CustomerOrderQuery;
import top.upstudy.crm.service.CustomerOrderService;

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
@RequestMapping("order")
public class CustomerOrderController extends BaseController {

    @Resource
    private CustomerOrderService customerOrderService;

    @ApiOperation("顾客所有订单")
    @GetMapping("list")
    @ResponseBody
    public Map<String,Object> queryCustomerOrdersByParams(CustomerOrderQuery customerOrderQuery){
        return customerOrderService.queryCustomerOrdersByParams(customerOrderQuery);
    }
}
