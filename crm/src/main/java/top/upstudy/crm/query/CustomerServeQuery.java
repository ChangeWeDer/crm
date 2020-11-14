package top.upstudy.crm.query;

import lombok.Data;
import top.upstudy.base.BaseQuery;

@Data
public class CustomerServeQuery extends BaseQuery {
    // 客户名
    private String customer;
    // 服务类型
    private Integer serveType;
    // 服务状态
    private String state;

    // 服务分配人
    private Integer assigner;
}
