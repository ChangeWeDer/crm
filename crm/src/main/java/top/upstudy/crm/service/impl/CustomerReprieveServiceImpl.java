package top.upstudy.crm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import top.upstudy.crm.mapper.CustomerLossMapper;
import top.upstudy.crm.pojo.CustomerReprieve;
import top.upstudy.crm.mapper.CustomerReprieveMapper;
import top.upstudy.crm.query.CustomerReprQuery;
import top.upstudy.crm.service.CustomerLossService;
import top.upstudy.crm.service.CustomerReprieveService;
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
public class CustomerReprieveServiceImpl extends ServiceImpl<CustomerReprieveMapper, CustomerReprieve> implements CustomerReprieveService {


    @Resource
    private CustomerLossMapper customerLossMapper;

    @Resource
    private CustomerReprieveMapper customerReprieveMapper;

    //查询暂缓数据
    public Map<String,Object> queryCustomerReprsByParams(CustomerReprQuery customerReprQuery){
        Map<String,Object> map=new HashMap<String,Object>();
        PageHelper.startPage(customerReprQuery.getPage(),customerReprQuery.getLimit());
        PageInfo<CustomerReprieve> pageInfo=new PageInfo<CustomerReprieve>(customerReprieveMapper.selectByParams(customerReprQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }


    //添加暂缓数据
    public void saveCustomerRepr(CustomerReprieve customerReprieve){
        /**
         * 1.参数校验
         *    流失客户id 非空 记录必须存在
         *    暂缓错误  measure 非空
         * 2.参数默认值设置
         *    isValid  createDate updateDate
         *  3.执行添加 判断结果
         */
        AssertUtil.isTrue(null == customerReprieve.getLossId()
                ||null == customerLossMapper.selectById(customerReprieve.getLossId()),"请指定流失客户id");
        AssertUtil.isTrue(StringUtils.isBlank(customerReprieve.getMeasure()),"请指定措施项!");
        customerReprieve.setIsValid(1);
        customerReprieve.setCreateDate(new Date());
        customerReprieve.setUpdateDate(new Date());
        AssertUtil.isTrue(customerReprieveMapper.insert(customerReprieve)<1,"暂缓措施添加失败!");
    }

    //更新暂缓数据
    public void updateCustomerRepr(CustomerReprieve customerReprieve){
        /**
         * 1.参数校验
         *    id 记录必须存在
         *    流失客户id 非空 记录必须存在
         *    暂缓错误  measure 非空
         * 2.参数默认值设置
         *     updateDate
         *  3.执行更新 判断结果
         */
        AssertUtil.isTrue(null == customerReprieveMapper.selectById(customerReprieve.getId()),"待更新的暂缓措施不存在!");
        AssertUtil.isTrue(null == customerReprieve.getLossId()
                || null == customerReprieveMapper.selectOne(new QueryWrapper<CustomerReprieve>().eq("loss_id",customerReprieve.getLossId())),"请指定流失客户id");
        AssertUtil.isTrue(StringUtils.isBlank(customerReprieve.getMeasure()),"请指定措施项!");
        customerReprieve.setUpdateDate(new Date());
        AssertUtil.isTrue(customerReprieveMapper.updateById(customerReprieve)<1,"暂缓措施更新失败!");
    }

    //删除暂缓数据
    public void deleteCustomerRepr(Integer id){
        CustomerReprieve temp = customerReprieveMapper.selectById(id);
        AssertUtil.isTrue(null== temp,"待删除的暂缓措施不存在!");
        AssertUtil.isTrue(customerReprieveMapper.deleteById(temp)<1,"记录删除失败!");
    }
}
