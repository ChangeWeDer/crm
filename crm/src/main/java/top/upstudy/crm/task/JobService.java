package top.upstudy.crm.task;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import top.upstudy.crm.service.CustomerService;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class JobService {
    @Resource
    private CustomerService customerService;

    @Scheduled(cron = "0 0/10 * * * ? ")
    public void job(){
        System.out.println("定时任务开始执行--->"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        customerService.updateCustomerState();
    }
}
