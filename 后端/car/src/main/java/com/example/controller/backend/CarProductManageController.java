package com.example.controller.backend;

import com.example.common.Const;
import com.example.common.ServerResponse;
import com.example.pojo.carProduct;
import com.example.pojo.carUser;
import com.example.service.IcarProductService;
import com.example.service.IcarUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by 李本维 on 2019/11/26.
 */
@RestController
@RequestMapping("/manage/product")
public class CarProductManageController {
    @Autowired
    private IcarProductService icarProductService;

    @Autowired
    private IcarUserService icarUserService;

    @GetMapping("/save")
    public ServerResponse productSave(HttpSession session,carProduct carProduct){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarProductService.saveOrUpdateProduct(carProduct);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("/setsalestatus")
    public ServerResponse setSaleStatus(HttpSession session,Integer productId,Integer status){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarProductService.setSaleStatus(productId,status);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("/detail")
    public ServerResponse getDetail(HttpSession session,Integer productId){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarProductService.manageProductDetail(productId);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("list")
    public ServerResponse getList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarProductService.getProductList(pageNum,pageSize);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("search")
    public ServerResponse productSearch(HttpSession session,String productName,Integer productId, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarProductService.searchProduct(productName,productId,pageNum,pageSize);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }
}
