package com.pankx.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pankx.bean.User;
import com.pankx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 查询所有用户信息，返回以json格式返回
     * @param pn
     * @return
     */
    @RequestMapping(value = "/user",method = GET)
    @ResponseBody
    public Msg getusers(@RequestParam(value = "pn",defaultValue = "1") int pn){
        //开始分页每页记录条数为5
        PageHelper.startPage(pn,5);
        //查询所有用户记录
        List<User> list = userService.getUsers();
        //封装查询结果
        PageInfo pageInfo = new PageInfo(list,5);
        Msg msg = Msg.success().add("pageinfo",pageInfo);
        return msg;
    }

}
