package com.example.dao;

import com.example.pojo.carOrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


/**
 * Created by 李本维 on 2019/11/23.
 */

public interface carOrderItemMapper {
    int insert(carOrderItem record);

    carOrderItem getByOrderNoUserId(@Param("orderNo")Long orderNo, @Param("userId") Integer userId);

    carOrderItem getByOrderNo(@Param("orderNo")Long orderNo);

    int deleteOrderItem(Long orderNo);
}
