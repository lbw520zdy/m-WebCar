package com.example.Vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import com.example.pojo.carOrderItem;
/**
 * Created by 李本维 on 2019/11/26.
 */
@Data
public class OrderVo {

    private Long orderNo;

    private String phone;

    private String address;


    private String address1;

    private Integer type1;

    private Integer type2;

    private BigDecimal payment;

    private Integer orderStatus;

    private carOrderItem carOrderItem;

    private String createTime;

    private String updateTime;




    public OrderVo(Long orderNo, String phone, String address, String address1, Integer type1, Integer type2, BigDecimal payment, Integer orderStatus, com.example.pojo.carOrderItem carOrderItem, String createTime, String updateTime) {
        this.orderNo = orderNo;
        this.phone = phone;
        this.address = address;
        this.address1 = address1;
        this.type1 = type1;
        this.type2 = type2;
        this.payment = payment;
        this.orderStatus = orderStatus;
        this.carOrderItem = carOrderItem;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public OrderVo() {
    }
}
