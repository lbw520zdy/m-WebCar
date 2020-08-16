package com.example.DTO;

import lombok.Data;

/**
 * Created by 李本维 on 2019/11/26.
 */
@Data
public class OrderDTO {
    private Integer userId;

    private Integer productId;

    private String address;

    private String address1;

    private Integer type1;

    private Integer type2;

    private Integer quantity;

    private Integer duration;
}
