package top.upstudy.crm.vo;

import lombok.Data;

//登录数据
@Data
public class loginUser {
    //id(加密)
    private String userId;
    //姓名
    private String userName;
    //密码
    private String trueName;
}
