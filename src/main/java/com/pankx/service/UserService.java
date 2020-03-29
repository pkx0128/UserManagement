package com.pankx.service;

import com.pankx.bean.UType;
import com.pankx.bean.User;
import com.pankx.bean.UserExample;
import com.pankx.dao.UTypeMapper;
import com.pankx.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UTypeMapper uTypeMapper;

    /**
     * 查询所有信息
     * @return
     */
    public List<User> getUsers(){
        return userMapper.selectByExampleWithUtype(null);
    }

    /**
     * 查询所有用户类型信息
     * @return
     */
    public List<UType> getUType(){
        return uTypeMapper.selectByExample(null);
    }

    public Boolean getUserByName(String userName){
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(userName);
        //返回true表示用户名可用
        return userMapper.countByExample(userExample) == 0;
    }

    /**
     * 保存用户数据数据
     * @param user
     * @return
     */
    public int saveuser(User user){
        return userMapper.insertSelective(user);
    }
}
