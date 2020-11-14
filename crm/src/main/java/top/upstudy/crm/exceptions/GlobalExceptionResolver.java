package top.upstudy.crm.exceptions;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import top.upstudy.base.ResultInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/*
    全局异常处理
    @ResponseBody响应内容为json数据，反之则是响应内容为页面
 */
@Component
public class GlobalExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, Exception e) {
        ModelAndView mv = new ModelAndView();

        //默认返回
        mv.setViewName("error");
        mv.addObject("code",500);
        mv.addObject("msg","系统出现异常，请稍后重试");

        //如果用户未登录，抛出未登录异常，则无需进行后续判断
        if(e instanceof UnLoginException){
            mv.setViewName("un_login");
            mv.addObject("msg","用户未登录！");
            mv.addObject("ctx",httpServletRequest.getContextPath());
            return mv;
        }
        //判断是否符合请求格式
        if (handler instanceof HandlerMethod){
            HandlerMethod hm = (HandlerMethod) handler;
            ResponseBody responseBody = hm.getMethod().getDeclaredAnnotation(ResponseBody.class);

            if(responseBody == null){
                //如果为视图
                //判断是否为参数异常
                if(e instanceof ParamsException){
                    ParamsException PE = (ParamsException) e;
                    mv.addObject("msg",PE.getMsg());
                    mv.addObject("code",PE.getCode());
                }
                //是否为认证异常
                else  if(e instanceof AuthException){
                    AuthException ae = (AuthException) e;
                    mv.addObject("msg",ae.getMsg());
                    mv.addObject("code",ae.getCode());
                }
                return mv;
            } else{
                //如果为json格式
                ResultInfo resultInfo = new ResultInfo();

                //默认数据
                resultInfo.setCode(500);
                resultInfo.setMsg("系统出现错误,稍后重试");

                //参数错误
                if(e instanceof ParamsException){
                    ParamsException PE = (ParamsException) e;
                    resultInfo.setCode(PE.getCode());
                    resultInfo.setMsg(PE.getMsg());
                }
                //如果是认证错误
                else  if(e instanceof AuthException){
                    AuthException ae = (AuthException) e;
                    resultInfo.setCode(ae.getCode());
                    resultInfo.setMsg(ae.getMsg());
                }
                //返回json格式的错误信息
                httpServletResponse.setContentType("application/json;charset=utf-8");
                httpServletResponse.setCharacterEncoding("utf-8");
                //使用流操作返回
                PrintWriter pw = null;
                try {
                    pw=httpServletResponse.getWriter();
                    pw.write(JSON.toJSONString(resultInfo));
                    pw.flush();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }finally {
                    if(null != pw){
                        pw.close();
                    }
                }
                return null;
            }

        } else {
            //返回默认数据
            return mv;
        }


    }
}
