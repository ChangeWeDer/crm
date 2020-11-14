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
 * @since 2020-10-31
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_customer")
@ApiModel(value="Customer对象", description="")
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "客户编号")
    private String customerId;

    @ApiModelProperty(value = "客户姓名")
    private String name;

    @ApiModelProperty(value = "客户所属地")
    private String area;

    @ApiModelProperty(value = "客户经理")
    private String cusManager;

    @ApiModelProperty(value = "客户级别")
    private String level;

    @ApiModelProperty(value = "客户满意度")
    private String satisfaction;

    @ApiModelProperty(value = "客户信誉")
    private String reputation;

    @ApiModelProperty(value = "客户地址")
    private String address;

    @ApiModelProperty(value = "邮编")
    private String postCode;

    @ApiModelProperty(value = "联系电话")
    private String phone;

    @ApiModelProperty(value = "传真")
    private String fax;

    @ApiModelProperty(value = "网址")
    private String webSite;

    @ApiModelProperty(value = "营业执照注册好")
    private String businessLicense;

    @ApiModelProperty(value = "法人代表")
    private String legalPerson;

    @ApiModelProperty(value = "注册资金")
    private String registeredCapital;

    @ApiModelProperty(value = "年营业额")
    private String turnover;

    @ApiModelProperty(value = "开户银行")
    private String bank;

    @ApiModelProperty(value = "开户账号")
    private String accountNumber;

    @ApiModelProperty(value = "地税登记号")
    private String localTaxNum;

    @ApiModelProperty(value = "国税登记号")
    private String nationalTaxNum;

    @ApiModelProperty(value = "流失状态")
    private Integer state;

    @ApiModelProperty(value = "有效时间")
    @TableLogic //逻辑删除
    private Integer isValid;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createDate;

    @ApiModelProperty(value = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date updateDate;


}
