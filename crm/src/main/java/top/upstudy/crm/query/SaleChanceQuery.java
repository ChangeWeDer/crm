package top.upstudy.crm.query;

import lombok.Data;
import top.upstudy.base.BaseQuery;

@Data
public class SaleChanceQuery extends BaseQuery {

    // 客户名
    private String customerName;

    // 创建人
    private String createMan;

    // 分配状态
    private String state;

    //分配人
    private Integer assignMan;

    // 开发状态
    private Integer devResult;

}
