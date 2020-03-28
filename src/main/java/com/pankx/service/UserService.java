package com.pankx.service;

import com.pankx.bean.User;
import com.pankx.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 查询所有信息
     * @return
     */
    public List<User> getUsers(){
        return userMapper.selectByExampleWithUtype(null);
    }
}
