package com.example.Vo;

import lombok.Data;

import java.util.List;

/**
 * Created by 李本维 on 2019/11/26.
 */
@Data
public class ProductVo {
    private String categoryName;

    private Integer categoryType;

    private List<ProductInfoVo> productInfoVOList;
}
