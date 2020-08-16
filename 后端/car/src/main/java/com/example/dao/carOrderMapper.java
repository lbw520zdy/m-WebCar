package com.example.dao;

import com.example.pojo.carOrder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 李本维 on 2019/11/23.
 */

public interface carOrderMapper {
    int insert(carOrder record);

    int updateByPrimaryKeySelective(carOrder record);

    carOrder selectByUserIdAndOrderNo(@Param("userId") Integer userId, @Param("orderNo") Long orderNo);

    carOrder selectByOrderNo(Long orderNo);

    List<carOrder> selectByUserId(Integer userId);

    List<carOrder> selectAllOrder();

    int deleteOrder(Long orderNo);

}
