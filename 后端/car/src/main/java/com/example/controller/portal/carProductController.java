package com.example.controller.portal;

import com.example.Vo.ProductInfoVo;
import com.example.Vo.ProductVo;
import com.example.common.ServerResponse;
import com.example.pojo.carCategory;
import com.example.pojo.carProduct;
import com.example.service.IcarCategoryService;
import com.example.service.IcarProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by 李本维 on 2019/11/26.
 */
@CrossOrigin
@RestController
@RequestMapping("/product")
public class carProductController {
    @Autowired
    private IcarProductService icarProductService;

    @Autowired
    private IcarCategoryService icarCategoryService;

    @GetMapping("/list")
    public ServerResponse<List<ProductVo>> list(){
        ServerResponse<List<carProduct>> response = icarProductService.getProductListOnStatus();
        List<carProduct> carProductList = response.getData();

        List<Integer> categoryTypeList = new ArrayList<>();
        for (carProduct carProduct : carProductList){
            categoryTypeList.add(carProduct.getCategoryType());
        }
        ServerResponse<List<carCategory>> response1 = icarCategoryService.findByCategoryTypeIn(categoryTypeList);
        List<carCategory> carCategoryList = response1.getData();

        List<ProductVo> productVOList = new ArrayList<>();

        for (carCategory productCategory : carCategoryList){
            ProductVo productVO = new ProductVo();
            productVO.setCategoryName(productCategory.getCategoryName());
            productVO.setCategoryType(productCategory.getCategoryType());

            List<ProductInfoVo> productInfoVOList = new ArrayList<>();
            for (carProduct productInfo : carProductList){
                if (productInfo.getCategoryType().equals(productCategory.getCategoryType())){
                    ProductInfoVo productInfoVO = new ProductInfoVo();
                    productInfoVO.setId(productInfo.getId());
                    productInfoVO.setName(productInfo.getName());
                    productInfoVO.setPrice(productInfo.getPrice());
                    productInfoVO.setDescrition(productInfo.getDescrition());
                    productInfoVO.setMainImage(productInfo.getMainImage());
                    productInfoVOList.add(productInfoVO);
                }
            }
            productVO.setProductInfoVOList(productInfoVOList);
            productVOList.add(productVO);
        }
        return ServerResponse.createBySuccess(productVOList);
    }
    @GetMapping("/detail")
    public ServerResponse<carProduct> detail(Integer productId){
        return icarProductService.getProductDetail(productId);
    }
}
