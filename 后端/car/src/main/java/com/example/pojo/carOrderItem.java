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
public class carOrderItem {


    private Integer id;

    private Integer userId;

    private Long orderNo;

    private Integer productId;

    private String productName;

    private String productImage;

    private BigDecimal currentUnitPrice;

    private Integer quantity;

    private BigDecimal totalPrice;

    private Date createTime;

    private Date updateTime;

    private Integer duration;

    public carOrderItem() {
    }

    public carOrderItem(Integer id, Integer userId, Long orderNo, Integer productId, String productName, String productImage, BigDecimal currentUnitPrice, Integer quantity, BigDecimal totalPrice, Date createTime, Date updateTime, Integer duration) {
        this.id = id;
        this.userId = userId;
        this.orderNo = orderNo;
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.currentUnitPrice = currentUnitPrice;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.duration = duration;
    }
}
