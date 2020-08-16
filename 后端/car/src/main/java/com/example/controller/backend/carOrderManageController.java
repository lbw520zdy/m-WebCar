package com.example.controller.backend;

import com.example.Vo.OrderVo;
import com.example.common.Const;
import com.example.common.ServerResponse;
import com.example.pojo.carUser;
import com.example.service.IcarOrderService;
import com.example.service.IcarUserService;
import com.github.pagehelper.PageInfo;
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
@RequestMapping("/manage/order")
public class carOrderManageController {
    @Autowired
    private IcarUserService icarUserService;

    @Autowired
    private IcarOrderService icarOrderService;

    @GetMapping("/list")
    public ServerResponse<PageInfo> orderList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarOrderService.manageList(pageNum,pageSize);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("/detail")
    public ServerResponse<OrderVo> orderDetail(HttpSession session,Long orderNo){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarOrderService.manageDetail(orderNo);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @GetMapping("/search")
    public ServerResponse<OrderVo> orderSearch(HttpSession session, Long orderNo){
        carUser user=(carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录管理员");
        }
        if (icarUserService.checkAdminRole(user).isSuccess()){
            return icarOrderService.manageSearch(orderNo);
        }else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }
}
