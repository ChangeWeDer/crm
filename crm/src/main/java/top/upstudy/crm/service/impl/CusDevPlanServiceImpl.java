package top.upstudy.crm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import top.upstudy.crm.mapper.SaleChanceMapper;
import top.upstudy.crm.pojo.CusDevPlan;
import top.upstudy.crm.mapper.CusDevPlanMapper;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.query.CusDevPlanQuery;
import top.upstudy.crm.service.CusDevPlanService;
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
 * @since 2020-10-17
 */
@Service
public class CusDevPlanServiceImpl extends ServiceImpl<CusDevPlanMapper, CusDevPlan> implements CusDevPlanService {

    @Resource
    private CusDevPlanMapper cusDevPlanMapper;

    @Resource
    private SaleChanceMapper saleChanceMapper;

    //通过条件查询当前用户被分配的记录
    public Map<String,Object> queryCusDevPlansByParams(CusDevPlanQuery cusDevPlanQuery){
        Map<String,Object> map = new HashMap<String,Object>();
        PageHelper.startPage(cusDevPlanQuery.getPage(),cusDevPlanQuery.getLimit());
        PageInfo<CusDevPlan> pageInfo = new PageInfo<CusDevPlan>(cusDevPlanMapper.selectByParams(cusDevPlanQuery));
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return  map;
    }

    //新增开发计划
    public void saveCusDevPlan(CusDevPlan cusDevPlan){
        //参数校验（非空）
        checkParams(cusDevPlan.getSaleChanceId(),cusDevPlan.getPlanItem(),cusDevPlan.getPlanDate());
        //设置逻辑存在、创建时间、更新时间
        cusDevPlan.setIsValid(1);
        cusDevPlan.setCreateDate(new Date());
        cusDevPlan.setUpdateDate(new Date());
        //添加记录
        AssertUtil.isTrue(cusDevPlanMapper.insert(cusDevPlan) < 1,"计划项记录添加失败!");
    }

    //编辑更新开发计划
    public void updateCusDevPlan(CusDevPlan cusDevPlan){
        //参数校验
        checkParams(cusDevPlan.getSaleChanceId(),cusDevPlan.getPlanItem(),cusDevPlan.getPlanDate());
        AssertUtil.isTrue(null == cusDevPlan.getId() || null == cusDevPlanMapper.selectById(cusDevPlan.getId()),"待更新的记录不存在!");
        //设置更新时间
        cusDevPlan.setUpdateDate(new Date());
        //更新结果
        AssertUtil.isTrue(cusDevPlanMapper.updateById(cusDevPlan) < 1,"记录更新失败!");
    }

    //删除一项开发计划
    public void deleteCusDevPlan(Integer id){
        CusDevPlan cusDevPlan= cusDevPlanMapper.selectById(id);
        AssertUtil.isTrue( null == cusDevPlan,"待删除的记录不存在!");
        //逻辑删除
        cusDevPlan.setIsValid(0);
        AssertUtil.isTrue(cusDevPlanMapper.updateById(cusDevPlan) < 1,"记录删除失败!");
    }

    //参数校验（非空）
    private void checkParams(Integer saleChanceId, String planItem, Date planDate) {
        AssertUtil.isTrue(null == saleChanceId || null == saleChanceMapper.selectById(saleChanceId),"请设置营销机会id");
        AssertUtil.isTrue(StringUtils.isBlank(planItem),"请输入计划项时间（例：2020-1-1）");
        AssertUtil.isTrue(null == planDate,"请指定计划项日期!");
    }
}
