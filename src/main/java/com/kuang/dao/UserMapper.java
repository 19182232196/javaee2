package com.kuang.dao;

import com.kuang.pojo.User;

/**
 * @author Yac
 * @version JDK 17
 * @className BookMapper
 * @date 2024年06月06日 20:42
 */
public interface UserMapper {
    public User loginUser(User user);
    void insert(User user);


}
