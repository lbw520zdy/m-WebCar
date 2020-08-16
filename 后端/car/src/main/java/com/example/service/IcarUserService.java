package com.example.service;

import com.example.common.ServerResponse;
import com.example.pojo.carUser;

/**
 * Created by 李本维 on 2019/11/25.
 */
public interface IcarUserService {
    ServerResponse<carUser> login(String username, String password);

    ServerResponse<carUser> register(carUser user);

    ServerResponse<String> selectQuestion(String username);

    ServerResponse<String> checkAnswer(String username,String question,String answer);

    ServerResponse<String> forgetResetPassword(String username,String passwordNew,String forgetToken);

    ServerResponse<String> resetPassword(String passwordOld,String passwordNew,carUser user);

    ServerResponse<carUser> updateInformation(carUser user);

    ServerResponse<carUser> getInformation(Integer userId);

    ServerResponse checkAdminRole(carUser user);
}
