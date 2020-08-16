package com.example.dao;

import com.example.pojo.carCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 李本维 on 2019/11/23.
 */

public interface carCategoryMapper {
    int insert(carCategory record);

    List<carCategory> findByCategoryTypeIn(@Param("categoryTypeList") List<Integer> categoryTypeList);

    carCategory selectBycategoryId(Integer categoryId);

    List<carCategory> selectAll();
}
