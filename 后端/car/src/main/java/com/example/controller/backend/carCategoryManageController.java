package com.example.controller.backend;

import com.example.common.Const;
import com.example.common.ServerResponse;
import com.example.pojo.carCategory;
import com.example.pojo.carUser;
import com.example.service.IcarCategoryService;
import com.example.service.IcarUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 李本维 on 2019/11/26.
 */
@RestController
@RequestMapping("/manage/category")
public class carCategoryManageController {

    @Autowired
    private IcarCategoryService icarCategoryService;

    @Autowired
    private IcarUserService icarUserService;

    @GetMapping("/addcategory")
    public ServerResponse addCategory(HttpSession session,String categoryName,Integer categoryType){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarCategoryService.save(categoryName,categoryType);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("/search")
    public ServerResponse searchCategory(HttpSession session,Integer categoryId){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarCategoryService.findOne(categoryId);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("list")
    public ServerResponse<List<carCategory>> list(HttpSession session){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarCategoryService.findAll();
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }
}
