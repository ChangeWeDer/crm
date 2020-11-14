package top.upstudy.crm.mapper;

import org.springframework.dao.DataAccessException;
import top.upstudy.base.BaseQuery;
import top.upstudy.crm.pojo.Customer;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.upstudy.crm.pojo.User;
import top.upstudy.crm.query.CustomerQuery;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
public interface CustomerMapper extends BaseMapper<Customer> {

    //多条件查询
    public List<Customer> selectByParams(BaseQuery baseQuery) throws DataAccessException;

    //查询流失的客户
    public List<Customer>  queryLossCustomers();

    //更新客户状态
    int  updateCustomerStateByIds(List<Integer> lossCusIds);

    //查询客户贡献
    public List<Map<String,Object>> queryCustomerContributionByParams(CustomerQuery customerQuery);

    //统计客户构成
    public List<Map<String,Object>>  countCustomerMake();

    //统计客户服务
    public List<Map<String,Object>>  countCustomerServe();

}
