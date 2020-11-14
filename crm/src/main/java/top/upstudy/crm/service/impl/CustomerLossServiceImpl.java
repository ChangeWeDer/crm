package top.upstudy.crm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import top.upstudy.crm.mapper.CustomerMapper;
import top.upstudy.crm.pojo.CustomerLoss;
import top.upstudy.crm.mapper.CustomerLossMapper;
import top.upstudy.crm.query.CustomerLossQuery;
import top.upstudy.crm.service.CustomerLossService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.utils.AssertUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-11-10
 */
@Service
public class CustomerLossServiceImpl extends ServiceImpl<CustomerLossMapper, CustomerLoss> implements CustomerLossService {

    @Resource
    private CustomerLossMapper customerLossMapper;

    @Resource
    private CustomerMapper customerMapper;

    //查询流失数据
    public Map<String,Object> queryCustomerLossByParams(CustomerLossQuery customerLossQuery){
        Map<String,Object> map = new HashMap<String,Object>();
        PageHelper.startPage(customerLossQuery.getPage(),customerLossQuery.getLimit());
        PageInfo<CustomerLoss> pageInfo = new PageInfo<CustomerLoss>(customerLossMapper.selectByParams(customerLossQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }

    //添加流失顾客
    public void updateCustomerLossStateById(Integer id, String lossReason) {
        CustomerLoss customerLoss = customerLossMapper.selectById(id);
        AssertUtil.isTrue(null == customerLoss,"待流失的客户记录不存在!");
        customerLoss.setState(0);// 0.确认流失
        customerLoss.setLossReason(lossReason);
        customerLoss.setConfirmLossTime(new Date());
        customerLoss.setUpdateDate(new Date());

        AssertUtil.isTrue(customerLossMapper.updateById(customerLoss) < 1,"确认流失失败!");
    }
}
