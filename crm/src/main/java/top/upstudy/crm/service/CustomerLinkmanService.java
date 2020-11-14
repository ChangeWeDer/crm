package top.upstudy.crm.service;

import top.upstudy.crm.pojo.CustomerLinkman;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Weder
 * @since 2020-11-01
 */
public interface CustomerLinkmanService extends IService<CustomerLinkman> {

    //更新联系人
    public  void updateCustomerLinkman(CustomerLinkman customerLinkman);
}
