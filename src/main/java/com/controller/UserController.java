package com.controller;

import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 用户列表
     * @param model
     * @return
     */
    @RequestMapping("/userList")
    public String userList(Model model){
        List<User> list=userService.getUsers();
        model.addAttribute("list",list);
        return "admin/user";

    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @RequestMapping("/saveUser")
    @ResponseBody
    public String saveUser(User user){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format( new Date());
        user.setRegisterTime(dateString);
        int a=userService.saveUser(user);
        if (a>0){
            return "ok";
        }else {
            return "error";
        }
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(User user){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format( new Date());
        user.setRegisterTime(dateString);
        System.out.println(user);
        int a=userService.addUser(user);
        if (a>0){
            return "ok";
        }else {
            return "error";
        }
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(int id){
        int a=userService.deleteUserById(id);
        if (a>0){
            return "ok";
        }else{
            return "";
        }
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(User user){
        userService.updateUser(user);
        return "";
    }

    /**
     *  // 通过（id 或 gender 或者id+gender）查询用户
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/getUserById")
    public String getUserById(User user,Model model){
        System.out.println(user);
        List<User> user1=userService.getUserById(user);
        System.out.println(user1.size());
        model.addAttribute("list",user1);
        return "admin/user";
    }

    /**
     * 封号操作
     * @param id
     * @return
     */
    @RequestMapping("/closeUser")
    @ResponseBody
    public String closeUser(int id){
        int a=userService.closeUser(id);

        if (a>0){
            return "ok";
        }else{
            return "error";
        }
    }

    /**
     * 封号列表
     * @param model
     * @return
     */
    @RequestMapping("/closeList")
    public String closeList(Model model){
        List<User> users=userService.getCloseUsers();
        model.addAttribute("closeList",users);
        return "admin/closeList";
    }

    /**
     * 通过账号查询封号的消息
     * @param loginname
     * @param model
     * @return
     */
    @RequestMapping("/getCloseUserByLoginName")
    public String getCloseUserByLoginName(String loginname,Model model){
        List<User> users=userService.getCloseUserByLoginName(loginname);
        model.addAttribute("closeList",users);
        return "admin/closeList";
    }
    /**
     * 解封操作
     * @param id
     * @return
     */
    @RequestMapping("/openUser")
    @ResponseBody
    public String openUser(int id){
        int a=userService.openUser(id);
        if (a>0){
            return "ok";
        }else{
            return "error";
        }
    }

}
