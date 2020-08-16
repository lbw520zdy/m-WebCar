package com.example.dao;

import com.example.pojo.carUser;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by 李本维 on 2019/11/26.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserDao {

    @Autowired
    private carUserMapper carUserMapper;

    @Test
    public void saveTest(){
        carUser carUser = new carUser();
        carUser.setUsername("wangwu");
        carUser.setPassword("12345678");
        carUser.setPhone("15361079753");
        carUser.setQuestion("我的儿子是谁？");
        carUser.setAnswer("马云");
        carUser.setRole(1);
        int result = carUserMapper.insert(carUser);
        Assert.assertNotEquals(0,result);
    }
}
