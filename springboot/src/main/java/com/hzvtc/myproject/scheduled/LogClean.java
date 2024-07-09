package com.hzvtc.myproject.scheduled;

import com.hzvtc.myproject.service.SystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 定时删除日志
 *
 */
//    这段代码是一个Spring框架中的定时任务类，用于定期删除系统日志。
//    通过@Scheduled注解和cron表达式，它定义了任务的执行时间和频率。
//    当定时任务触发时，它会调用SystemLogService的deleteByMonth方法来删除旧的系统日志。
//    这样，系统就可以定期清理不再需要的日志，以保持系统的性能和存储空间的有效利用。

//@Component注解：表明这个类是一个Spring组件，Spring的IoC容器会自动扫描到它并把它作为Bean注册到上下文中。
@Component
public class LogClean {
//    @Autowired注解：Spring提供的注解，用于自动装配Bean。
//    这里它会自动将SystemLogService类型的Bean注入到systemLogService字段中。
    @Autowired
    private SystemLogService systemLogService;

//    @Scheduled注解：Spring框架中用于声明定时任务的注解。

//    cron = "0 0 0 * * ?"：定义了一个cron表达式，用于指定任务的执行时间。
//    这里的表达式表示任务将在每天的（00:00:00）执行，s min h 日期 月份 周
    @Scheduled(cron = "0 0 0 * * ?")
//    调用SystemLogService的deleteByMonth方法，这个方法用于删除一个月前的系统日志。
    public void logClean() {
        systemLogService.deleteByMonth();
    }
}
