package com.example.service.imp;

import com.example.common.ServerResponse;
import com.example.pojo.carCategory;
import com.example.service.IcarCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.dao.carCategoryMapper;
import java.util.List;

/**
 * Created by 李本维 on 2019/11/26.
 */
@Service
public class carCategoryImp implements IcarCategoryService {

    @Autowired
    private carCategoryMapper carCategoryMapper;

    @Override
    public ServerResponse<carCategory> findOne(Integer categoryId) {
        carCategory carCategory = carCategoryMapper.selectBycategoryId(categoryId);
        return ServerResponse.createBySuccess(carCategory);
    }

    @Override
    public ServerResponse<List<carCategory>> findAll() {
        List<carCategory> carCategoryList = carCategoryMapper.selectAll();
        return ServerResponse.createBySuccess(carCategoryList);
    }

    @Override
    public ServerResponse<List<carCategory>> findByCategoryTypeIn(List<Integer> categoryTypeList) {
        List<carCategory> carCategoryList =carCategoryMapper.findByCategoryTypeIn(categoryTypeList);
        return ServerResponse.createBySuccess(carCategoryList);
    }

    @Override
    public ServerResponse<String> save(String categoryName,Integer categoryType) {
        carCategory carCategory = new carCategory();
        carCategory.setCategoryName(categoryName);
        carCategory.setCategoryType(categoryType);
        int resultCount = carCategoryMapper.insert(carCategory);
        if (resultCount > 0) {
            return ServerResponse.createBySuccessMessage("添加分类成功");
        }
        return ServerResponse.createByErrorMessage("添加分类失败");
    }
}
