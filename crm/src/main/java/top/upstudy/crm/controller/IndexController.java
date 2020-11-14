package top.upstudy.crm.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import top.upstudy.base.BaseController;
import top.upstudy.crm.pojo.User;
import top.upstudy.crm.service.PermissionService;
import top.upstudy.crm.service.UserService;
import top.upstudy.crm.utils.LoginUserUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class IndexController extends BaseController {

    @Resource
    private UserService userService;

    @Resource
    private PermissionService permissionService;

    //系统登录页
    @ApiOperation("登录页")
    @GetMapping("index")
    public String index(){
        return "index";
    }


    //系统欢迎页
    @ApiOperation("系统欢迎页")
    @GetMapping("welcome")
    public String welcome(){
        return "welcome";
    }

    //后台管理页
    @ApiOperation("后台管理页")
    @GetMapping(value = {"/","main"})
    public String admin(HttpServletRequest request) {
        //通过id查询用户的信息
        Integer userId = LoginUserUtil.releaseUserIdFromCookie(request);
        User user = userService.getById(userId);
        //得到用户信息后返回
        request.setAttribute("user",user);
        //通过用户id查询该用户所拥有得权限，将查到得权限放到session中，以作为权限控制
        List<String> permissions = permissionService.queryUserHasRoleIdsHasModuleIds(userId);
        request.getSession().setAttribute("permissions",permissions);
        return "main";
    }
}
