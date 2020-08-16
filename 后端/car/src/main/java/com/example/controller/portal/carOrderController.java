package com.example.controller.portal;

import com.example.DTO.OrderDTO;
import com.example.Vo.OrderVo;
import com.example.common.Const;
import com.example.common.ServerResponse;
import com.example.pojo.carUser;
import com.example.service.IcarOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 李本维 on 2019/11/26.
 */
@RestController
@RequestMapping("/order")
public class carOrderController {
    @Autowired
    private IcarOrderService icarOrderService;

    @GetMapping("/create")
    public ServerResponse<OrderVo> create(OrderDTO orderDTO, HttpSession session){
        carUser user = (carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录");
        }
        orderDTO.setUserId(user.getId());
        return icarOrderService.createOrder(orderDTO);
    }

    @GetMapping("/cancel")
    public ServerResponse cancel(HttpSession session,Long orderNo){
        carUser user = (carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录");
        }
        return icarOrderService.cancel(user.getId(),orderNo);
    }

    @GetMapping("/finish")
    public ServerResponse finish(HttpSession session,Long orderNo){
        carUser user = (carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录");
        }
        return icarOrderService.finish(user.getId(),orderNo);
    }

    @GetMapping("/delete")
    public ServerResponse<String> delete(HttpSession session,Long orderNo){
        carUser user = (carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录");
        }
        return icarOrderService.deleteOrder(orderNo);
    }
    
    @GetMapping("/detail")
    public ServerResponse<OrderVo> detail(HttpSession session,Long orderNo){
        carUser user = (carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录");
        }
        return icarOrderService.getOrderDetail(user.getId(),orderNo);
    }
    @GetMapping("/list")
    public ServerResponse<List<OrderVo>> list(HttpSession session){
        carUser user = (carUser)session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMessage("用户未登录，请登录");
        }
        return icarOrderService.getOrderList(user.getId());
    }
}
