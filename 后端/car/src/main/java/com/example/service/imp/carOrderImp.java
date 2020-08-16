package com.example.service.imp;

import com.example.DTO.OrderDTO;
import com.example.Vo.OrderVo;
import com.example.common.Const;
import com.example.common.ServerResponse;
import com.example.pojo.carOrder;
import com.example.pojo.carOrderItem;
import com.example.pojo.carProduct;
import com.example.pojo.carUser;
import com.example.service.IcarOrderService;
import com.example.util.BigDecimalUtil;
import com.example.util.DateTimeUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.dao.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by 李本维 on 2019/11/25.
 */
@Service
public class carOrderImp implements IcarOrderService {
    @Autowired
    private carProductMapper carProductMapper;
    @Autowired
    private carOrderMapper carOrderMapper;
    @Autowired
    private carOrderItemMapper carOrderItemMapper;
    @Autowired
    private carUserMapper carUserMapper;
    @Override
    @Transactional
    public ServerResponse createOrder(OrderDTO orderDTO) {
        carProduct carProduct = carProductMapper.selectByPrimaryKey(orderDTO.getProductId());
        carUser carUser = carUserMapper.selectByPrimaryKey(orderDTO.getUserId());
        if (carProduct == null) {
            return ServerResponse.createByErrorMessage("不存在该商品");
        }
        if (carProduct.getStock() == 0){
            return ServerResponse.createByErrorMessage("该商品库存不足");
        }
        Integer result = carProduct.getStock() - orderDTO.getQuantity();
        if (result < 0){
            return ServerResponse.createByErrorMessage("该商品库存不足");
        }
        carOrderItem carOrderItem = new carOrderItem();
        Long orderNo = generateOrderNo();
        carOrderItem.setUserId(orderDTO.getUserId());
        carOrderItem.setOrderNo(orderNo);
        carOrderItem.setProductId(carProduct.getId());
        carOrderItem.setProductName(carProduct.getName());
        carOrderItem.setProductImage(carProduct.getMainImage());
        carOrderItem.setCurrentUnitPrice(carProduct.getPrice());
        carOrderItem.setQuantity(orderDTO.getQuantity());
        carOrderItem.setDuration(orderDTO.getDuration());

        BigDecimal payment = BigDecimalUtil.mul(carProduct.getPrice().doubleValue(),orderDTO.getQuantity().doubleValue());
        BigDecimal amountpayment = BigDecimalUtil.mul(payment.doubleValue(),orderDTO.getDuration().doubleValue());

        carOrderItem.setTotalPrice(amountpayment);

        carOrderItemMapper.insert(carOrderItem);

        carOrder carOrder = new carOrder();
        carOrder.setUserId(orderDTO.getUserId());
        carOrder.setOrderNo(orderNo);
        carOrder.setPhone(carUser.getPhone());
        carOrder.setAddress(orderDTO.getAddress());
        carOrder.setPayment(amountpayment);
        carOrder.setOrderStatus(Const.OrderStatusEnum.NO_PAY.getCode());
        carOrder.setAddress1(orderDTO.getAddress1());
        carOrder.setType1(orderDTO.getType1());
        carOrder.setType2(orderDTO.getType2());
        carOrderMapper.insert(carOrder);

        carProduct.setStock(result);

        carProductMapper.updateByPrimaryKeySelective(carProduct);

        OrderVo orderVo = new OrderVo();
        orderVo.setOrderNo(carOrder.getOrderNo());
        orderVo.setOrderStatus(carOrder.getOrderStatus());
        orderVo.setAddress(carOrder.getAddress());
        orderVo.setAddress1(carOrder.getAddress1());
        orderVo.setType1(carOrder.getType1());
        orderVo.setType2(carOrder.getType2());
        orderVo.setPhone(carOrder.getPhone());
        orderVo.setPayment(carOrder.getPayment());
        orderVo.setCarOrderItem(carOrderItem);
        orderVo.setCreateTime(DateTimeUtil.dateToStr(carOrder.getCreateTime()));
        orderVo.setUpdateTime(DateTimeUtil.dateToStr(carOrder.getUpdateTime()));

        return ServerResponse.createBySuccess("创建订单成功",orderVo);
    }

    private Long generateOrderNo(){
        long currentTime = System.currentTimeMillis();
        return currentTime+new Random().nextInt(100);
    }

    @Override
    @Transactional
    public ServerResponse<String> cancel(Integer userId, Long orderNo) {
        carOrder carOrder = carOrderMapper.selectByUserIdAndOrderNo(userId,orderNo);
        if (carOrder.getOrderStatus() == Const.OrderStatusEnum.PAID.getCode()){
            return ServerResponse.createByErrorMessage("该订单已付款，无法取消");
        }
        if (carOrder.getOrderStatus() == Const.OrderStatusEnum.CANCELED.getCode()){
            return ServerResponse.createByErrorMessage("该订单已取消，无法再次取消");
        }
        carOrder.setOrderStatus(Const.OrderStatusEnum.CANCELED.getCode());
        carOrderMapper.updateByPrimaryKeySelective(carOrder);
        carOrderItem  carOrderItem = carOrderItemMapper.getByOrderNoUserId(orderNo,userId);
        carProduct carProduct = carProductMapper.selectByPrimaryKey(carOrderItem.getProductId());
        carProduct.setStock(carProduct.getStock() + 1);
        carProductMapper.updateByPrimaryKeySelective(carProduct);
        return ServerResponse.createBySuccessMessage("取消订单成功");
    }

    @Override
    public ServerResponse<String> finish(Integer userId, Long orderNo) {
        carOrder carOrder = carOrderMapper.selectByUserIdAndOrderNo(userId,orderNo);
        if (carOrder.getOrderStatus().equals(Const.OrderStatusEnum.CANCELED)){
            return ServerResponse.createByErrorMessage("订单已取消");
        }
        if (carOrder.getOrderStatus().equals(Const.OrderStatusEnum.PAID)){
            return ServerResponse.createByErrorMessage("订单已付款");
        }
         carOrder.setOrderStatus(Const.OrderStatusEnum.PAID.getCode());
        int result = carOrderMapper.updateByPrimaryKeySelective(carOrder);
        if (result == 0 ){
            return ServerResponse.createByErrorMessage("订单支付失败");
        }


        return ServerResponse.createBySuccessMessage("订单支付成功");
    }

    @Override
    public ServerResponse<OrderVo> getOrderDetail(Integer userId, Long orderNo) {
        carOrder carOrder = carOrderMapper.selectByUserIdAndOrderNo(userId,orderNo);
        if (carOrder != null){
            carOrderItem carOrderItem = carOrderItemMapper.getByOrderNoUserId(orderNo,userId);
            OrderVo orderVo = new OrderVo();
            orderVo.setOrderNo(carOrder.getOrderNo());
            orderVo.setOrderStatus(carOrder.getOrderStatus());
            orderVo.setAddress(carOrder.getAddress());
            orderVo.setAddress1(carOrder.getAddress1());
            orderVo.setType1(carOrder.getType1());
            orderVo.setType2(carOrder.getType2());
            orderVo.setPhone(carOrder.getPhone());
            orderVo.setPayment(carOrder.getPayment());
            orderVo.setCarOrderItem(carOrderItem);
            orderVo.setCreateTime(DateTimeUtil.dateToStr(carOrder.getCreateTime()));
            orderVo.setUpdateTime(DateTimeUtil.dateToStr(carOrder.getUpdateTime()));
            return ServerResponse.createBySuccess(orderVo);
        }


        return ServerResponse.createByErrorMessage("没有找到该订单");
    }

    @Override
    public ServerResponse<List<OrderVo>> getOrderList(Integer userId) {
        List<carOrder> carOrderList = carOrderMapper.selectByUserId(userId);
        List<OrderVo> orderVoList = new ArrayList<>();
        for (carOrder carOrder : carOrderList){
            carOrderItem carOrderItem = carOrderItemMapper.getByOrderNoUserId(carOrder.getOrderNo(),userId);
            OrderVo orderVo = new OrderVo();
            orderVo.setOrderNo(carOrder.getOrderNo());
            orderVo.setOrderStatus(carOrder.getOrderStatus());
            orderVo.setAddress(carOrder.getAddress());
            orderVo.setAddress1(carOrder.getAddress1());
            orderVo.setType1(carOrder.getType1());
            orderVo.setType2(carOrder.getType2());
            orderVo.setPhone(carOrder.getPhone());
            orderVo.setPayment(carOrder.getPayment());
            orderVo.setCarOrderItem(carOrderItem);
            orderVo.setCreateTime(DateTimeUtil.dateToStr(carOrder.getCreateTime()));
            orderVo.setUpdateTime(DateTimeUtil.dateToStr(carOrder.getUpdateTime()));
            orderVoList.add(orderVo);
        }
        return ServerResponse.createBySuccess(orderVoList);
    }

    @Override
    public ServerResponse<PageInfo> manageList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<carOrder> carOrderList = carOrderMapper.selectAllOrder();
        List<OrderVo> orderVoList = new ArrayList<>();
        for (carOrder carOrder : carOrderList){
            carOrderItem carOrderItem = carOrderItemMapper.getByOrderNoUserId(carOrder.getOrderNo(),null);
            OrderVo orderVo = new OrderVo();
            orderVo.setOrderNo(carOrder.getOrderNo());
            orderVo.setOrderStatus(carOrder.getOrderStatus());
            orderVo.setAddress(carOrder.getAddress());
            orderVo.setAddress1(carOrder.getAddress1());
            orderVo.setType1(carOrder.getType1());
            orderVo.setType2(carOrder.getType2());
            orderVo.setPhone(carOrder.getPhone());
            orderVo.setPayment(carOrder.getPayment());
            orderVo.setCarOrderItem(carOrderItem);
            orderVo.setCreateTime(DateTimeUtil.dateToStr(carOrder.getCreateTime()));
            orderVo.setUpdateTime(DateTimeUtil.dateToStr(carOrder.getUpdateTime()));
            orderVoList.add(orderVo);
        }
        PageInfo pageResult = new PageInfo(carOrderList);
        pageResult.setList(orderVoList);
        return ServerResponse.createBySuccess(pageResult);
    }

    @Override
    public ServerResponse<OrderVo> manageDetail(Long orderNo) {
        carOrder carOrder = carOrderMapper.selectByOrderNo(orderNo);
        if (carOrder != null){
            carOrderItem carOrderItem = carOrderItemMapper.getByOrderNo(orderNo);
            OrderVo orderVo = new OrderVo();
            orderVo.setOrderNo(carOrder.getOrderNo());
            orderVo.setOrderStatus(carOrder.getOrderStatus());
            orderVo.setAddress(carOrder.getAddress());
            orderVo.setAddress1(carOrder.getAddress1());
            orderVo.setType1(carOrder.getType1());
            orderVo.setType2(carOrder.getType2());
            orderVo.setPhone(carOrder.getPhone());
            orderVo.setPayment(carOrder.getPayment());
            orderVo.setCarOrderItem(carOrderItem);
            orderVo.setCreateTime(DateTimeUtil.dateToStr(carOrder.getCreateTime()));
            orderVo.setUpdateTime(DateTimeUtil.dateToStr(carOrder.getUpdateTime()));
            return ServerResponse.createBySuccess(orderVo);
        }
        return ServerResponse.createByErrorMessage("订单不存在");
    }

    @Override
    public ServerResponse<OrderVo> manageSearch(Long orderNo) {
        carOrder carOrder = carOrderMapper.selectByOrderNo(orderNo);
        if (carOrder != null){
            carOrderItem carOrderItem =carOrderItemMapper.getByOrderNo(orderNo);
            OrderVo orderVo = new OrderVo();
            orderVo.setOrderNo(carOrder.getOrderNo());
            orderVo.setOrderStatus(carOrder.getOrderStatus());
            orderVo.setAddress(carOrder.getAddress());
            orderVo.setAddress1(carOrder.getAddress1());
            orderVo.setType1(carOrder.getType1());
            orderVo.setType2(carOrder.getType2());
            orderVo.setPhone(carOrder.getPhone());
            orderVo.setPayment(carOrder.getPayment());
            orderVo.setCarOrderItem(carOrderItem);
            orderVo.setCreateTime(DateTimeUtil.dateToStr(carOrder.getCreateTime()));
            orderVo.setUpdateTime(DateTimeUtil.dateToStr(carOrder.getUpdateTime()));
            return ServerResponse.createBySuccess(orderVo);
        }
        return ServerResponse.createByErrorMessage("订单不存在");
    }

    @Override
    public ServerResponse<String> deleteOrder(Long orderNo) {
        carOrder carOrder = carOrderMapper.selectByOrderNo(orderNo);
        carOrderItem carOrderItem = carOrderItemMapper.getByOrderNo(orderNo);
        if (carOrder == null && carOrderItem == null){
            return ServerResponse.createByErrorMessage("该订单不存在");
        }
        int result1 = carOrderMapper.deleteOrder(orderNo);
        int result2 = carOrderItemMapper.deleteOrderItem(orderNo);
        if (result1 > 0 && result2 > 0){
            return ServerResponse.createBySuccessMessage("删除订单成功");
        }else {
            return ServerResponse.createByErrorMessage("删除订单失败");
        }
    }
}
