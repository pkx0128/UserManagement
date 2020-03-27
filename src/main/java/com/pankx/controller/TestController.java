package com.pankx.controller;

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
        List<User> list = testService.getUser();
        model.addAttribute("users",list);
        return "testsuccess";
    }
}
