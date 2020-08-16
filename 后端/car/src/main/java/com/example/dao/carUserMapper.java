package com.example.dao;

import com.example.pojo.carUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * Created by 李本维 on 2019/11/23.
 */

public interface carUserMapper {
    int insert(carUser record);

    carUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(carUser record);

    int checkUsername(String username);

    carUser selectLogin(@Param("username") String username, @Param("password") String password);

    String selectQuestionByUsername(String username);

    int checkAnswer(@Param("username") String username,@Param("question") String question,@Param("answer") String answer);

    int upadatePasswordByUsername(@Param("username") String username,@Param("passwordNew") String passwordNew);

    int checkPassword(@Param("password") String password,@Param("userId") Integer userId);
}
