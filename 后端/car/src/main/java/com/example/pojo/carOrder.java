package com.example.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 李本维 on 2019/11/22.
 */
@Data
public class carOrder {

    private Integer id;

    private Long orderNo;

    private Integer userId;

    private String phone;

    private String address;

    private BigDecimal payment;

    private Integer orderStatus;

    private Date createTime;

    private Date updateTime;

    private String address1;

    private Integer type1;

    private Integer type2;

    public carOrder() {

    }

    public carOrder(Integer id, Long orderNo, Integer userId, String phone, String address, BigDecimal payment, Integer orderStatus, Date createTime, Date updateTime, String address1, Integer type1, Integer type2) {
        this.id = id;
        this.orderNo = orderNo;
        this.userId = userId;
        this.phone = phone;
        this.address = address;
        this.payment = payment;
        this.orderStatus = orderStatus;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.address1 = address1;
        this.type1 = type1;
        this.type2 = type2;
    }
}
