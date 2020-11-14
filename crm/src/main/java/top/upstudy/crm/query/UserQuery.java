package top.upstudy.crm.query;

import lombok.Data;
import top.upstudy.base.BaseQuery;

@Data
public class UserQuery extends BaseQuery {
    //姓名
    private String userName;
    //邮箱
    private String email;
    //电话
    private String phone;
}
