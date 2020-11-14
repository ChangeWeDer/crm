package top.upstudy.crm.service;

import top.upstudy.crm.pojo.Datadic;
import com.baomidou.mybatisplus.extension.service.IService;
import top.upstudy.crm.pojo.SaleChance;
import top.upstudy.crm.query.DataDicQuery;
import top.upstudy.crm.query.SaleChanceQuery;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-11-12
 */
public interface DatadicService extends IService<Datadic> {

    //查询字典
    public Map<String,Object> queryDataDicByParams(DataDicQuery dataDicQuery);

    //添加
    public void saveDataDic(Datadic datadic);

    //更新记录
    public void updateDataDic(Datadic datadic);

    //批量删除
    public void deleteDataDic(Integer[] ids);
}
