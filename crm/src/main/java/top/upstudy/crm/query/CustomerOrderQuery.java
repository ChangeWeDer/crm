package top.upstudy.crm.query;

import top.upstudy.base.BaseQuery;

public class CustomerOrderQuery extends BaseQuery {
    private Integer cusId;

    public Integer getCusId() {
        return cusId;
    }

    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }
}