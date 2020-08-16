package com.example.service;

import com.example.common.ServerResponse;
import com.example.pojo.carProduct;
import com.github.pagehelper.PageInfo;


import java.util.List;

/**
 * Created by 李本维 on 2019/11/25.
 */
public interface IcarProductService {

    //用户
    ServerResponse<carProduct> getProductDetail(Integer productId);


    ServerResponse<List<carProduct> > getProductListOnStatus();

    //管理员
    ServerResponse saveOrUpdateProduct(carProduct product);

    ServerResponse<PageInfo> getProductList(int pageNum, int pageSize);

    ServerResponse<String> setSaleStatus(Integer productId,Integer status);

    ServerResponse<PageInfo> searchProduct(String productName, Integer productId, int pageNum, int pageSize);

    ServerResponse<carProduct> manageProductDetail(Integer productId);



}
