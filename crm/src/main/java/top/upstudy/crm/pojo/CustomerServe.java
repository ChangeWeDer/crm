package top.upstudy.crm.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * <p>
 * 
 * </p>
 *
 * @author Weder
 * @since 2020-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_customer_serve")
@ApiModel(value="CustomerServe对象", description="")
public class CustomerServe implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "服务类型")
    private String serveType;

    @ApiModelProperty(value = "概要")
    private String overview;

    @ApiModelProperty(value = "客户")
    private String customer;

    @ApiModelProperty(value = "服务状态")
    private String state;

    @ApiModelProperty(value = "服务请求")
    private String serviceRequest;

    @ApiModelProperty(value = "服务创建人")
    private String createPeople;

    @ApiModelProperty(value = "服务分配人")
    private String assigner;

    @ApiModelProperty(value = "分配时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date assignTime;

    @ApiModelProperty(value = "服务处理")
    private String serviceProce;

    @ApiModelProperty(value = "服务处理人")
    private String serviceProcePeople;

    @ApiModelProperty(value = "服务处理时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date serviceProceTime;

    @ApiModelProperty(value = "处理结果")
    private String serviceProceResult;

    @ApiModelProperty(value = "满意度")
    private String satisfaction;

    @ApiModelProperty(value = "是否有效")
    @TableLogic //逻辑删除
    private Integer isValid;

    @ApiModelProperty(value = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date updateDate;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createDate;

    // 服务类型
    @TableField(strategy= FieldStrategy.NOT_EMPTY,exist=false) //自定义字段
    private String dicValue;


}
