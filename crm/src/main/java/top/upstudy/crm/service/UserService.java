package top.upstudy.crm.service;

import top.upstudy.crm.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.UserQuery;
import top.upstudy.crm.vo.loginUser;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-14
 */
public interface UserService extends IService<User> {

    //登录逻辑
    public loginUser login(String userName, String userPwd);

    //修改用户信息逻辑
    public void updateUserInfo(Integer userId,String userOldPwd,String newPwd,String confirmPwd);

    //查询所有销售人员
    public List<Map<String,Object>> queryAllSales();

    //查询用户
    public Map<String,Object> queryUsersByParams(UserQuery userQuery);

    //添加用户
    public  void saveUser(User user);

    //角色更新操作
    public  void updateUser(User user);

    //批量删除
    public void deleteUserByIds(Integer[] ids);


    //查询所有客户经理
    List<Map<String, Object>> queryAllCustomerManager();
}
