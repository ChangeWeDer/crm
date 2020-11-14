package top.upstudy.crm.vo;

import lombok.Data;

/**
 * 这里不能使用Lombok的@Data注解，
 * 如果使用了会导致pId在返回数据为pid，将不符合z—tree的规范
 */
//显示权限目录
public class ZTree {
    private Integer id;
    private Integer pId;
    private String name;
    //判断是否当前角色已被授权该资源（被授权则为true），让前台可以显示被勾选
    private Boolean checked=false;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }


}
