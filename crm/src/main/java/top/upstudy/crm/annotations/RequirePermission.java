package top.upstudy.crm.annotations;


import java.lang.annotation.*;

/**
 * 后端接口权限控制注解
 * code对应permission表中得acl_value字段
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequirePermission {

    // 权限码
    String code() default "";
}
