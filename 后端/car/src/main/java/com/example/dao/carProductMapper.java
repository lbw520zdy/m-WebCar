package com.example.dao;

import com.example.pojo.carProduct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 李本维 on 2019/11/23.
 */

public interface carProductMapper {

    int insert(carProduct record);

    carProduct selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(carProduct record);

    int updateByPrimaryKey(carProduct record);

    List<carProduct> selectList();

    List<carProduct> selectListByOnStatus();

    List<carProduct> selectByNameAndProductId(@Param("productName") String productName, @Param("productId") Integer productId);

}
