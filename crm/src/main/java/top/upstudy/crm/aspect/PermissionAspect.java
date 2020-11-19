package top.upstudy.crm.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import top.upstudy.crm.annotations.RequirePermission;
import top.upstudy.crm.exceptions.AuthException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Component
@Aspect
public class PermissionAspect {

    @Resource
    private HttpSession session;

    /**
     * 添加后端接口权限控制功能
     * 接口请求前 判断请求得用户是否拥有该接口请求权限
     * 使用aop实现
     */
    @Around(value = "@annotation(top.upstudy.crm.annotations.RequirePermission)")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        Object result = null;

        List<String> permissions = (List<String>)session.getAttribute("permissions");

        //如果没有任何权限，抛出异常
        if (null == permissions || permissions.size() == 0){
            throw new AuthException();
        }

        //获取传入的权限码
        MethodSignature methodSignature = (MethodSignature) proceedingJoinPoint.getSignature();
        RequirePermission requirePermission = methodSignature.getMethod().getDeclaredAnnotation(RequirePermission.class);

        //查看获取的权限码是否属于角色权限（存在session）
        //methodSignature.getMethod().getDeclaredAnnotation(RequirePermission.class);
        if(!(permissions.contains(requirePermission.code()))){
            throw  new AuthException();
        }
        result = proceedingJoinPoint.proceed();
        return result;
    }
}
