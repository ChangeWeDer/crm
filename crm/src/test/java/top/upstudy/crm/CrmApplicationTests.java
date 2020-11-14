package top.upstudy.crm;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import top.upstudy.crm.mapper.CusDevPlanMapper;
import top.upstudy.crm.mapper.SaleChanceMapper;
import top.upstudy.crm.mapper.UserMapper;
import top.upstudy.crm.pojo.SaleChance;
import top.upstudy.crm.pojo.User;
import top.upstudy.crm.query.SaleChanceQuery;
import top.upstudy.crm.service.UserService;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest
class CrmApplicationTests {

    @Resource
    SaleChanceMapper saleChanceMapper;

    @Resource
    CusDevPlanMapper cusDevPlanMapper;

    @Resource
    UserMapper userMapper;

    @Autowired
    UserService userService;
    @Test
    void contextLoads() {
        //SaleChanceQuery saleChanceQuery = new SaleChanceQuery();

        //SaleChance saleChance = saleChanceMapper.selectById(1);
        //System.out.println(saleChance);
        //List<SaleChance> saleChances = saleChanceMapper.selectByParams(saleChanceQuery);
        //User user = cusDevPlanMapper.test();
        //System.out.println(user);
    }

}
