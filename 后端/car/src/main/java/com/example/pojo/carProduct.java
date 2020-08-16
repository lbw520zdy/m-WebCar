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
public class carProduct {

    private Integer id;

    private Integer categoryType;

    private String descrition;

    private String name;

    private String mainImage;

    private String detailImage1;

    private String detailImage2;

    private String detailImage3;

    private BigDecimal price;

    private Integer stock;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    public carProduct(Integer id, Integer categoryType, String descrition, String name, String mainImage, String detailImage1, String detailImage2, String detailImage3, BigDecimal price, Integer stock, Integer status, Date createTime, Date updateTime) {
        this.id = id;
        this.categoryType = categoryType;
        this.descrition = descrition;
        this.name = name;
        this.mainImage = mainImage;
        this.detailImage1 = detailImage1;
        this.detailImage2 = detailImage2;
        this.detailImage3 = detailImage3;
        this.price = price;
        this.stock = stock;
        this.status = status;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public carProduct(){

    }
}
