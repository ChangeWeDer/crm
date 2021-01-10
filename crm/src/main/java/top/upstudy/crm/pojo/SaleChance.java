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

/**
 * <p>
 * 
 * </p>
 *
 * @author Weder
 * @since 2020-10-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_sale_chance")
@ApiModel(value="SaleChance对象", description="")
public class SaleChance implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "机会来源")
    private String chanceSource;

    @ApiModelProperty(value = "客户名称")
    private String customerName;

    @ApiModelProperty(value = "成功几率")
    private Integer successPossibility;

    @ApiModelProperty(value = "概要")
    private String overview;

    @ApiModelProperty(value = "联系人")
    private String linkMan;

    @ApiModelProperty(value = "手机号")
    private String linkPhone;

    @ApiModelProperty(value = "描述")
    private String description;

    @ApiModelProperty(value = "创建人")
    private String createMan;

    //有可能为需要更新为空值，所以需要验证非空
    @ApiModelProperty(value = "分配人")
    @TableField(strategy=FieldStrategy.IGNORED)
    private String assignMan;

    //通过assignMan获取
    @ApiModelProperty(value = "分配人姓名")
    @TableField(strategy=FieldStrategy.NOT_EMPTY,exist=false) //自定义字段
    private String assignName;

    @ApiModelProperty(value = "分配时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date assignTime;

    @ApiModelProperty(value = "分配状态")
    private Integer state;

    @ApiModelProperty(value = "开发结果")
    private Integer devResult;

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
