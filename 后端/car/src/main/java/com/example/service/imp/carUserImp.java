package com.example.service.imp;

import com.example.common.Const;
import com.example.common.RedisConstant;
import com.example.common.ServerResponse;
import com.example.pojo.carUser;
import com.example.dao.carUserMapper;
import com.example.service.IcarUserService;
import com.example.util.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * Created by 李本维 on 2019/11/25.
 */
@Service
public class carUserImp implements IcarUserService {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private carUserMapper carUserMapper;

    @Override
    public ServerResponse<carUser> login(String username, String password) {
        int resultCount = carUserMapper.checkUsername(username);
        if (resultCount == 0) {
            return ServerResponse.createByErrorMessage("用户不存在");
        }
        String md5Password = MD5Util.MD5EncodeUtf8(password);

        carUser carUser = carUserMapper.selectLogin(username,md5Password);

        if (carUser == null) {
            return ServerResponse.createByErrorMessage("密码错误");
        }

        carUser.setPassword(StringUtils.EMPTY);

        return ServerResponse.createBySuccess("登录成功",carUser);
    }

    @Override
    public ServerResponse<carUser> register(carUser user) {
        int resultCount = carUserMapper.checkUsername(user.getUsername());
        if (resultCount > 0 ){
            return ServerResponse.createByErrorMessage("用户名已存在");
        }
        user.setRole(Const.Role.ROLE_CUSTOMER);
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        int i = carUserMapper.insert(user);
        user.setPassword(StringUtils.EMPTY);
        if (i == 0) {
            return  ServerResponse.createByErrorMessage("注册失败");
        }
        return ServerResponse.createBySuccess("注册成功",user);
    }

    @Override
    public ServerResponse<String> selectQuestion(String username) {
        int resultCount = carUserMapper.checkUsername(username);
        if (resultCount == 0 ) {
            return ServerResponse.createByErrorMessage("用户不存在");
        }
        String question = carUserMapper.selectQuestionByUsername(username);
        if (StringUtils.isNotBlank(question)) {
            return ServerResponse.createBySuccess(question);
        }
        return ServerResponse.createByErrorMessage("找回密码的问题是空的");
    }

    @Override
    public ServerResponse<String> checkAnswer(String username, String question, String answer) {
        int resultCount = carUserMapper.checkAnswer(username,question,answer);
        if (resultCount > 0 ){
            String token = UUID.randomUUID().toString();
            Integer expire = RedisConstant.EXPIRE;
            redisTemplate.opsForValue().set(RedisConstant.TOKEN_PREFIX+username,token,expire, TimeUnit.SECONDS);
            return ServerResponse.createBySuccess(token);
        }
        return ServerResponse.createByErrorMessage("问题的答案错误");
    }

    @Override
    public ServerResponse<String> forgetResetPassword(String username, String passwordNew, String token) {
        if (StringUtils.isBlank(token)){
            return ServerResponse.createByErrorMessage("参数错误，token需要传递");
        }
        int resultCount = carUserMapper.checkUsername(username);
        if (resultCount == 0) {
            return ServerResponse.createByErrorMessage("用户不存在");
        }
        String forgetToken = redisTemplate.opsForValue().get(RedisConstant.TOKEN_PREFIX+username);
        if (StringUtils.isBlank(forgetToken)){
            return ServerResponse.createByErrorMessage("token无效或者过期");
        }
        if (StringUtils.equals(token,forgetToken)) {
            String md5Password = MD5Util.MD5EncodeUtf8(passwordNew);
            int rowCount = carUserMapper.upadatePasswordByUsername(username,md5Password);
            if (rowCount > 0){
                return ServerResponse.createBySuccessMessage("修改密码成功");
            }
        }else {
            return ServerResponse.createByErrorMessage("token错误，请重新获取重置密码的token");
        }
        return ServerResponse.createByErrorMessage("修改密码失败");
    }

    @Override
    public ServerResponse<String> resetPassword(String passwordOld, String passwordNew, carUser user) {
        int resultCount = carUserMapper.checkPassword(MD5Util.MD5EncodeUtf8(passwordOld),user.getId());
        if (resultCount == 0){
            return ServerResponse.createByErrorMessage("旧密码错误");
        }
        user.setPassword(MD5Util.MD5EncodeUtf8(passwordNew));
        int updateCount = carUserMapper.updateByPrimaryKeySelective(user);
        if (updateCount > 0){
            return ServerResponse.createBySuccessMessage("密码更新成功");
        }
        return ServerResponse.createByErrorMessage("密码更新失败");
    }

    @Override
    public ServerResponse<carUser> updateInformation(carUser user) {
        carUser updateUser = new carUser();
        updateUser.setId(user.getId());
        updateUser.setPhone(user.getPhone());
        updateUser.setQuestion(user.getQuestion());
        updateUser.setAnswer(user.getAnswer());

        int updateCount = carUserMapper.updateByPrimaryKeySelective(updateUser);
        if (updateCount > 0){
            return  ServerResponse.createBySuccess("更新个人信息成功",updateUser);
        }
        return ServerResponse.createByErrorMessage("更新个人信息失败");
    }

    @Override
    public ServerResponse<carUser> getInformation(Integer userId) {
        carUser user=carUserMapper.selectByPrimaryKey(userId);
        if (user == null){
            return ServerResponse.createByErrorMessage("找不到当前用户");
        }
        user.setPassword(StringUtils.EMPTY);
        return ServerResponse.createBySuccess(user);
    }

    @Override
    public ServerResponse checkAdminRole(carUser user) {
        if (user != null && user.getRole().intValue() == Const.Role.ROLE_ADMIN){
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
