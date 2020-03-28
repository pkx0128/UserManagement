package com.pankx.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pankx.bean.User;
import com.pankx.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    private TestService testService;

    @RequestMapping("/getusers")
    public String getusers(Model model){
        PageHelper.startPage(1,5);
        List<User> list = testService.getUser();
        PageInfo pageInfo = new PageInfo(list,5);
        model.addAttribute("users",pageInfo);
        System.out.println(list);
        return "testsuccess";
    }
}
