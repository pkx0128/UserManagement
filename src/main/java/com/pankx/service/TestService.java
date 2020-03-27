package com.pankx.service;

import com.pankx.bean.User;
import com.pankx.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.soap.SOAPBinding;
import java.util.List;

@Service
public class TestService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 测试查询
     * @return
     */
    public List<User> getUser(){
        System.out.println("Service 的getuser");
        return userMapper.selectByExample(null);

    }

}
