package com.example.service;

import com.example.common.ServerResponse;
import com.example.pojo.carCategory;

import java.util.List;

/**
 * Created by 李本维 on 2019/11/26.
 */
public interface IcarCategoryService {
    ServerResponse<carCategory> findOne(Integer categoryId);

    ServerResponse<List<carCategory>> findAll();

    ServerResponse<List<carCategory>> findByCategoryTypeIn(List<Integer> categoryTypeList);

    ServerResponse<String> save(String categoryName,Integer categoryType);
}
