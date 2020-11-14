package top.upstudy.crm.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.segments.MergeSegments;
import org.apache.commons.lang3.StringUtils;
import top.upstudy.crm.pojo.Customer;
import top.upstudy.crm.pojo.CustomerLinkman;
import top.upstudy.crm.mapper.CustomerLinkmanMapper;
import top.upstudy.crm.service.CustomerLinkmanService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.upstudy.crm.utils.AssertUtil;
import top.upstudy.crm.utils.PhoneUtil;

import javax.annotation.Resource;
import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Weder
 * @since 2020-11-01
 */
@Service
public class CustomerLinkmanServiceImpl extends ServiceImpl<CustomerLinkmanMapper, CustomerLinkman> implements CustomerLinkmanService {

    @Resource
    private CustomerLinkmanMapper customerLinkmanMapper;

    //更新联系人
    public  void updateCustomerLinkman(CustomerLinkman customerLinkman){

        //参数校验
        checkParams(customerLinkman.getLinkName(),customerLinkman.getPhone(), customerLinkman.getPosition());
        //查找是否存在
        CustomerLinkman temp = customerLinkmanMapper.selectOne(new QueryWrapper<CustomerLinkman>().eq("cus_id",customerLinkman.getCusId()));
        AssertUtil.isTrue(null == temp,"待更新的客户记录不存在!");
        //更新时间
        customerLinkman.setUpdateDate(new Date());
        AssertUtil.isTrue(customerLinkmanMapper.updateById(customerLinkman) < 1,"客户记录更新失败!");

        }


    //参数校验
    private void checkParams(String name, String phone, String legalPerson) {
        AssertUtil.isTrue(StringUtils.isBlank(name),"请指定联系人名称!");
        AssertUtil.isTrue(!(PhoneUtil.isMobile(phone)),"手机号格式非法!");
        AssertUtil.isTrue(StringUtils.isBlank(legalPerson),"请指定联系人职位!");
    }
}
