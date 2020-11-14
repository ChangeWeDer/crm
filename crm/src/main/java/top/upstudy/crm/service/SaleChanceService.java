package top.upstudy.crm.service;

import top.upstudy.crm.pojo.SaleChance;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.query.SaleChanceQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-10-17
 */
public interface SaleChanceService extends IService<SaleChance> {

    //通过传入参数查询营销机会
    public Map<String,Object> querySaleChanceByParams(SaleChanceQuery saleChanceQuery);

    //添加营销机会
    public void saveSaleChance(SaleChance saleChance);

    //更新营销机会记录
    public void updateSaleChance(SaleChance saleChance);

    //批量删除
    public void deleteSaleChance(Integer[] ids);

    //更新开发结果
    public void updateSaleChanceDevResult(Integer id, Integer devResult);


}
