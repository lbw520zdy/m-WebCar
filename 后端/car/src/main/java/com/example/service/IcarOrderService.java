package com.example.service;

import com.example.DTO.OrderDTO;
import com.example.Vo.OrderVo;
import com.example.common.ServerResponse;
import com.example.pojo.carOrderItem;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by 李本维 on 2019/11/25.
 */
public interface IcarOrderService {

    ServerResponse createOrder(OrderDTO orderDTO);

    ServerResponse<String> cancel(Integer userId,Long orderNo);

    ServerResponse<String> finish(Integer userId,Long orderNo);

    ServerResponse<OrderVo> getOrderDetail(Integer userId, Long orderNo);

    ServerResponse<List<OrderVo>> getOrderList(Integer userId);

    ServerResponse<PageInfo> manageList(int pageNum,int pageSize);

    ServerResponse<OrderVo> manageDetail(Long orderNo);

    ServerResponse<OrderVo> manageSearch(Long orderNo);

    ServerResponse<String> deleteOrder(Long orderNo);
}
