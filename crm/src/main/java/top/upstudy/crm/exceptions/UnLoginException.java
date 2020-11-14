package top.upstudy.crm.exceptions;

/**
 * 自定义参数异常
 */
public class UnLoginException extends RuntimeException {
    private Integer code=300;
    private String msg="用户未登录!";


    public UnLoginException() {
        super("用户未登录!");
    }

    public UnLoginException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public UnLoginException(Integer code) {
        super("用户未登录!");
        this.code = code;
    }

    public UnLoginException(Integer code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
