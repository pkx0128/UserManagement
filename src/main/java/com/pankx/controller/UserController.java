package com.pankx.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pankx.bean.UType;
import com.pankx.bean.User;
import com.pankx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.*;

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

    /**
     * 查询所有用户类型信息，返回json格式
     * @return
     */

    @RequestMapping(value = "/utype",method = GET)
    @ResponseBody
    public Msg getutype(){
        List<UType> list = userService.getUType();
        Msg msg = Msg.success().add("utype",list);
        return msg;
    }

    /**
     * 校验用户名
     * @param userName
     * @return
     */
    @RequestMapping(value = "/checkusername",method = POST)
    @ResponseBody
    public Msg checkusername(@RequestParam("userName") String userName){
        if(userService.getUserByName(userName)){
            return Msg.success().add("v_msg","用户名可用");
        }else{
            return Msg.fail().add("v_msg","用户名重复不可用");
        }
    }

    /**
     * 保存数据
     * @param user
     * @return
     */
    @RequestMapping("/saveuser")
    @ResponseBody
    public Msg saveuser(User user){
        if(userService.saveuser(user) == 1){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    /**
     * 根据id查询用户信息
     * @param id
     * @return
     */
    @RequestMapping("/getuser/{id}")
    @ResponseBody
    public Msg getuserbyid(@PathVariable Integer id){
        User user = userService.getuserbyid(id);
       return Msg.success().add("user",user);
    }

    /**
     * 根据ID更新用户信息
     * @param user
     * @return
     */
    @RequestMapping(value = "/user/{userId}",method = PUT)
    @ResponseBody
    public Msg updateuser(User user){
        userService.updateuser(user);
        return Msg.success();
    }

    /**
     * 根据id删除用户信息
     * @param userId
     * @return
     */
    @RequestMapping(value = "/user/{userId}",method = DELETE)
    @ResponseBody
    public Msg deluser(@PathVariable Integer userId){
        userService.deleteuserbyid(userId);
        return Msg.success();
    }

}
