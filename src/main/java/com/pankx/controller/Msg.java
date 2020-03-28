package com.pankx.controller;

import java.util.HashMap;
import java.util.Map;

//通用返回信息类
public class Msg {
    private int code;
    private String msg;
    Map<String,Object> reldata = new HashMap<String,Object>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMsg("处理成功");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMsg("处理失败");
        return msg;
    }
    //添加返回数据
    public Msg add(String key,Object value){
        this.reldata.put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public Map<String, Object> getReldata() {
        return reldata;
    }

    public void setReldata(Map<String, Object> reldata) {
        this.reldata = reldata;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }


}
