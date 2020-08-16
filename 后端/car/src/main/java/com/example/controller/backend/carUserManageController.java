package com.example.controller.backend;

import com.example.common.Const;
import com.example.common.ServerResponse;
import com.example.pojo.carUser;
import com.example.service.IcarUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by 李本维 on 2019/11/26.
 */
@RestController
@RequestMapping("/manage/user")
public class carUserManageController {
    @Autowired
    private IcarUserService icarUserService;

    @PostMapping("/login")
    public ServerResponse<carUser> login(String username, String password, HttpSession session){
        ServerResponse<carUser> response = icarUserService.login(username,password);
        if (response.isSuccess()){
            carUser carUser = response.getData();
            if (carUser.getRole() == Const.Role.ROLE_ADMIN){
                session.setAttribute(Const.CURRENT_USER,carUser);
                return response;
            }else {
                return ServerResponse.createByErrorMessage("不是管理员,无法登录");
            }
        }
        return response;
    }
}
