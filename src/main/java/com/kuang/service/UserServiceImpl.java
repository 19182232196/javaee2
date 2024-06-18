package com.kuang.service;

import com.kuang.dao.UserMapper;
import com.kuang.pojo.User;
/**
 * @author Yac
 * @version JDK 17
 * @className BookMapper
 * @date 2024年06月06日 20:42
 */
public class UserServiceImpl implements UserService {

    public UserMapper userMapper;
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User loginUser(User user) {
        return userMapper.loginUser(user);
    }

    @Override
    public void register(User user) {
        userMapper.insert(user);
    }


}
