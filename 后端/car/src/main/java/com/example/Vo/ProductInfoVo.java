package com.example.Vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by 李本维 on 2019/11/26.
 */
@Data
public class ProductInfoVo {

    private Integer id;

    private String descrition;

    private String name;

    private String mainImage;

    private BigDecimal price;
}
