package top.upstudy.crm.service;

import top.upstudy.crm.pojo.CusDevPlan;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.CusDevPlanQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-17
 */
public interface CusDevPlanService extends IService<CusDevPlan> {

    //通过条件查询当前用户被分配的记录
    public Map<String,Object> queryCusDevPlansByParams(CusDevPlanQuery cusDevPlanQuery);

    //新增开发计划
    public void saveCusDevPlan(CusDevPlan cusDevPlan);

    //编辑更新开发计划
    public void updateCusDevPlan(CusDevPlan cusDevPlan);

    //删除一项开发计划
    public void deleteCusDevPlan(Integer id);
}
