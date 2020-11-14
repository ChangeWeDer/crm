package top.upstudy.crm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import top.upstudy.crm.enums.DevResult;
import top.upstudy.crm.enums.StateStatus;
import top.upstudy.crm.pojo.Datadic;
import top.upstudy.crm.mapper.DatadicMapper;
import top.upstudy.crm.pojo.SaleChance;
import top.upstudy.crm.query.DataDicQuery;
import top.upstudy.crm.query.SaleChanceQuery;
import top.upstudy.crm.service.DatadicService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.utils.AssertUtil;
import top.upstudy.crm.utils.PhoneUtil;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-11-12
 */
@Service
public class DatadicServiceImpl extends ServiceImpl<DatadicMapper, Datadic> implements DatadicService {

    @Resource
    private DatadicMapper datadicMapper;

    //查询字典
    public Map<String,Object> queryDataDicByParams(DataDicQuery dataDicQuery){

        //把查询值放在map中
        Map<String,Object> map = new HashMap<String, Object>();

        //获取分页状态
        PageHelper.startPage(dataDicQuery.getPage(),dataDicQuery.getLimit());
        //使用了pageHelper查询结果并分页
        PageInfo<Datadic> pageInfo = new PageInfo<>(datadicMapper.selectByParams(dataDicQuery));
        //将获取到的分页信息放入map中，然后返回
        map.put("code",0);
        map.put("msg","");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        //返回结果集
        return map;
    }

    //添加
    public void saveDataDic(Datadic datadic){
        checkParams(datadic.getDataDicName(),datadic.getDataDicValue());
        //逻辑存在
        datadic.setIsValid(1);
        //写入创建和更新时间
        datadic.setCreateDate(new Date());
        datadic.setUpdateDate(new Date());
        //插入数据
        AssertUtil.isTrue(datadicMapper.insert(datadic) < 1,"数据添加失败!");
    }

    //检查插入参数
    private void checkParams(String DataDicName, String DataDicValue){
        AssertUtil.isTrue(StringUtils.isBlank(DataDicName),"数据类型不能为空!");
        AssertUtil.isTrue(StringUtils.isBlank(DataDicValue),"数据值不能为空!");
    }

    //更新记录
    public void updateDataDic(Datadic datadic){

        checkParams(datadic.getDataDicName(),datadic.getDataDicValue());

        //先查询将要更新的记录在不在，获取对象
        Datadic temp = datadicMapper.selectById(datadic.getId());
        AssertUtil.isTrue(null == temp,"待更新记录不存在!");

        //写入当前记录的更新时间
        datadic.setUpdateDate(new Date());

        //查看更新结果
        AssertUtil.isTrue(datadicMapper.updateById(datadic) < 1,"数据更新失败!");
    }


    //批量删除
    public void deleteDataDic(Integer[] ids){
        AssertUtil.isTrue(null == ids || ids.length == 0,"请选择待删除记录!");
        AssertUtil.isTrue(datadicMapper.deleteBatchIds(Arrays.asList(ids)) != ids.length,"记录删除失败!");
    }
}
