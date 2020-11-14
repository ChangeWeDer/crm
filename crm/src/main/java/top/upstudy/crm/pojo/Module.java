package top.upstudy.crm.pojo;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author Weder
 * @since 2020-10-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_module")
@ApiModel(value="Module对象", description="")
public class Module implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "资源id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "资源名")
    private String moduleName;

    @ApiModelProperty(value = "模块样式")
    private String moduleStyle;

    @ApiModelProperty(value = "资源地址")
    private String url;

    @ApiModelProperty(value = "上级资源id")
    private Integer parentId;

    @ApiModelProperty(value = "上级资源权限码")
    private String parentOptValue;

    @ApiModelProperty(value = "层级")
    private Integer grade;

    @ApiModelProperty(value = "权限值")
    private String optValue;

    @ApiModelProperty(value = "排序号")
    private Integer orders;

    @ApiModelProperty(value = "有效状态")
    @TableLogic //逻辑删除
    private Integer isValid;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createDate;

    @ApiModelProperty(value = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date updateDate;


}
