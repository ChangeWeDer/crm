package top.upstudy.crm.query;

import lombok.Data;
import top.upstudy.base.BaseQuery;

@Data
public class CustomerLossQuery extends BaseQuery {
    private String cusNo;

    private String cusName;

    private Integer state;

}
