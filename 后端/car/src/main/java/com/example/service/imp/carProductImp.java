package com.example.service.imp;

import com.example.common.Const;
import com.example.common.ResponseCode;
import com.example.common.ServerResponse;
import com.example.pojo.carProduct;
import com.example.service.IcarProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.dao.carProductMapper;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 李本维 on 2019/11/25.
 */
@Service
public class carProductImp implements IcarProductService {

    @Autowired
    private carProductMapper carProductMapper;

    @Override
    public ServerResponse<carProduct> getProductDetail(Integer productId) {
        if (productId == null){
            return  ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        carProduct product = carProductMapper.selectByPrimaryKey(productId);
        if (product == null){
            return  ServerResponse.createByErrorMessage("产品已下架或者删除");
        }
        if (product.getStatus() != Const.ProductStatusEnum.ON_SALE.getCode()){
            return  ServerResponse.createByErrorMessage("产品已下架或者删除");
        }
        return ServerResponse.createBySuccess(product);
    }

    @Override
    public ServerResponse<List<carProduct>> getProductListOnStatus() {
        List<carProduct> carProductList = new ArrayList<>();
        carProductList = carProductMapper.selectListByOnStatus();
        return ServerResponse.createBySuccess(carProductList);
    }

    @Override
    public ServerResponse saveOrUpdateProduct(carProduct product) {
        if (product != null){
            if (product.getId() != null){
                    int rowCount=carProductMapper.updateByPrimaryKey(product);
                    if (rowCount > 0){
                        return  ServerResponse.createBySuccessMessage("更新产品成功");
                    }
                    return  ServerResponse.createBySuccessMessage("更新产品失败");
                }else {
                    int rowCount = carProductMapper.insert(product);
                    if (rowCount > 0) {
                        return ServerResponse.createBySuccessMessage("新增产品成功");
                    }
                    return ServerResponse.createBySuccessMessage("新增产品失败");
            }
        }
        return ServerResponse.createByErrorMessage("新增或更新产品参数不正确");
    }

    @Override
    public ServerResponse<PageInfo> getProductList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<carProduct> carProductList = carProductMapper.selectList();
        PageInfo pageResult = new PageInfo(carProductList);
        return ServerResponse.createBySuccess(pageResult);
    }

    @Override
    public ServerResponse<String> setSaleStatus(Integer productId, Integer status) {
        if (productId == null || status == null){
            return  ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        carProduct product = new carProduct();
        product.setId(productId);
        product.setStatus(status);
        int rowCount = carProductMapper.updateByPrimaryKeySelective(product);
        if (rowCount > 0){
            return ServerResponse.createBySuccess("修改产品销售状态成功");
        }
        return  ServerResponse.createByErrorMessage("修改产品销售状态失败");
    }

    @Override
    public ServerResponse<PageInfo> searchProduct(String productName, Integer productId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        if (StringUtils.isNotBlank(productName)){
            productName = new StringBuilder().append("%").append(productName).append("%").toString();
        }
        List<carProduct> productList = carProductMapper.selectByNameAndProductId(productName,productId);
        PageInfo pageResult = new PageInfo(productList);
        return ServerResponse.createBySuccess(pageResult);
    }

    @Override
    public ServerResponse<carProduct> manageProductDetail(Integer productId) {
        if (productId == null){
            return  ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        carProduct product = carProductMapper.selectByPrimaryKey(productId);
        if (product == null){
            return  ServerResponse.createByErrorMessage("产品已下架或者删除");
        }

        return ServerResponse.createBySuccess(product);
    }
}
