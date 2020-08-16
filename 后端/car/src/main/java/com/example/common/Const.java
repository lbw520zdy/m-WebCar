package com.example.common;

/**
 * Created by 李本维 on 2019/11/25.
 */
public class Const {

    public static final String CURRENT_USER = "currentUser";

    public interface  Role{
        int VIP_CUSTOMER = 0; //vip会员
        int ROLE_CUSTOMER = 1; //普通用户
        int ROLE_ADMIN = 2; //管理员
    }

    public enum ProductStatusEnum {
        ON_SALE(1, "在线");
        private String value;
        private int code;

        ProductStatusEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }
        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }
    }

    public enum OrderStatusEnum{
        CANCELED(2,"已取消"),
        NO_PAY(0,"未支付"),
        PAID(1,"已付款"),
        ;
        private String value;
        private int code;


        OrderStatusEnum(int code,String value){
            this.code = code;
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }

        public static OrderStatusEnum codeOf(int code){
            for (OrderStatusEnum orderStatusEnum : values()){
                if (orderStatusEnum.getCode() == code){
                    return orderStatusEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }
    }
}
