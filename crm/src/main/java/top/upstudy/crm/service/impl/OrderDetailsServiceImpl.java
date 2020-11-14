package top.upstudy.crm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import top.upstudy.crm.pojo.OrderDetails;
import top.upstudy.crm.mapper.OrderDetailsMapper;
import top.upstudy.crm.query.OrderDetailsQuery;
import top.upstudy.crm.service.OrderDetailsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-10-31
 */
@Service
public class OrderDetailsServiceImpl extends ServiceImpl<OrderDetailsMapper, OrderDetails> implements OrderDetailsService {

    @Resource
    private OrderDetailsMapper orderDetailsMapper;

    //查询订单记录
    public Map<String,Object> queryOrderDetailsByParams(OrderDetailsQuery orderDetailsQuery){
        Map<String,Object> map=new HashMap<String,Object>();
        PageHelper.startPage(orderDetailsQuery.getPage(),orderDetailsQuery.getLimit());
        PageInfo<OrderDetails> pageInfo=new PageInfo<OrderDetails>(orderDetailsMapper.selectByParams(orderDetailsQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }
}
