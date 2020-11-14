package top.upstudy.crm.utils;

import org.apache.commons.lang3.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PhoneUtil {

    public static  boolean isMobile(String phone){
        Pattern p = null;
        Matcher m = null;
        boolean b = false;
        // 验证手机号
        String s2="^[1](([3|5|8][\\d])|([4][4,5,6,7,8,9])|([6][2,5,6,7])|([7][^9])|([9][1,8,9]))[\\d]{8}$";
        if(StringUtils.isNotBlank(phone)){
            p = Pattern.compile(s2);
            m = p.matcher(phone);
            b = m.matches();
        }
        return b;
    }

    public static void main(String[] args) {
        System.out.println(isMobile("19699999999"));
    }
}
