package com.example.controller.portal;

import com.example.common.Const;
import com.example.common.ServerResponse;
import com.example.pojo.carUser;
import com.example.service.IcarUserService;
import com.example.service.imp.RandomImgCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 李本维 on 2019/11/26.
 */

@RestController
@RequestMapping("/user")
public class carUserController {

    @Autowired
    private IcarUserService icarUserService;

    @Autowired
    private RandomImgCodeUtil randomImgCodeUtil;

    @PostMapping("/login")
    public ServerResponse<carUser> login(String username, String password, HttpSession session){
        ServerResponse<carUser> response =icarUserService.login(username,password);
        if (response.isSuccess()){
            session.setAttribute(Const.CURRENT_USER,response.getData());
            System.out.println(session.getId());
            System.out.println(session.getAttribute(Const.CURRENT_USER));
        }
        return response;
    }

    @PostMapping("/logout")
    public ServerResponse<String> logout(HttpSession session){
        carUser carUser = (carUser) session.getAttribute(Const.CURRENT_USER);
        if (carUser != null) {
            session.removeAttribute(Const.CURRENT_USER);
            return ServerResponse.createBySuccessMessage("退出成功");
        }
        return ServerResponse.createByErrorMessage("用户未登录");
    }

    @PostMapping("/register")
    public ServerResponse<carUser> register(carUser carUser){
        return icarUserService.register(carUser);
    }

    @GetMapping("/getuserinfo")
    public ServerResponse<carUser> getUserInfo(HttpSession session){
        carUser carUser = (carUser) session.getAttribute(Const.CURRENT_USER);
        if (carUser != null) {
            return ServerResponse.createBySuccess(carUser);
        }
        return ServerResponse.createByErrorMessage("用户未登录,无法获取当前用户的信息");
    }

    @PostMapping("/forgetgetquestion")
    public ServerResponse<String> forgetGetQuestion(String username){
        return icarUserService.selectQuestion(username);
    }

    @PostMapping("/forgetcheckanswer")
    public ServerResponse<String> forgetCheckAnswer(String username,String question,String answer){
        return icarUserService.checkAnswer(username,question,answer);
    }

    @PostMapping("/forgetrestpassword")
    public ServerResponse<String> forgetRestPassword(String username,String passwordNew,String forgetToken){
        return icarUserService.forgetResetPassword(username,passwordNew,forgetToken);
    }

    @PostMapping("/restpassword")
    public ServerResponse<String> restPassword(HttpSession session,String passwordOld,String passwordNew){
        carUser carUser = (carUser) session.getAttribute(Const.CURRENT_USER);
        if (carUser == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        return icarUserService.resetPassword(passwordOld,passwordNew,carUser);
    }

    @PostMapping("/updateinformation")
    public ServerResponse<carUser> update_information(HttpSession session,carUser carUser){
        carUser CurrentUser=(carUser) session.getAttribute(Const.CURRENT_USER);
        if (CurrentUser == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        carUser.setId(CurrentUser.getId());
        carUser.setUsername(carUser.getUsername());
        ServerResponse<carUser> response = icarUserService.updateInformation(carUser);
        if (response.isSuccess()){
            session.setAttribute(Const.CURRENT_USER,response.getData());
        }
        return response;
    }

    @PostMapping("/getinformation")
    public ServerResponse<carUser> getInformation(HttpSession session){
        carUser CurrentUser=(carUser) session.getAttribute(Const.CURRENT_USER);
        if (CurrentUser == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        return icarUserService.getInformation(CurrentUser.getId());
    }
    @PostMapping("/yanzhengma")
    public ServerResponse<String> getyanzhengma(HttpSession session) throws Exception{
        String code = RandomImgCodeUtil.getStringRandom(4,session);
        String yzm = randomImgCodeUtil.imageToBase64(120,40,code);
        return ServerResponse.createBySuccess(code,yzm);
    }
}
