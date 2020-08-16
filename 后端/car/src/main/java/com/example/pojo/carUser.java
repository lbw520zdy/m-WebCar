package com.example.pojo;

import java.util.Date;
import lombok.Data;


/**
 * Created by 李本维 on 2019/11/22.
 */
@Data
public class carUser {

    private Integer id;

    private String username;

    private String password;

    private String phone;

    private String question;

    private String answer;

    private Integer role;

    private Date createTime;

    private Date updateTime;

    public carUser() {
    }

    public carUser(Integer id, String username, String password, String phone, String question, String answer, Integer role, Date createTime, Date updateTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.question = question;
        this.answer = answer;
        this.role = role;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }
}
