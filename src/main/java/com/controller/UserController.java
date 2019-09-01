package com.controller;

import com.entity.Comic;
import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
        user.setPhotoPath("1.png");
        int a=userService.addUser(user);
        if (a>0){
            return "ok";
        }else {
            return "error";
        }
    }

    @RequestMapping("/userLogin")
    @ResponseBody
    public String adminLogin(User user,HttpServletRequest request){
        User list=userService.loginCheck(user);
        if (list!=null){
            request.getSession().setAttribute("userSession",list);
            return "ok";
        }else {
            return "error";
        }
    }

    @RequestMapping("/exitUser")
    public void exitUser(HttpServletRequest request){
       request.getSession().invalidate();
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
     * 更新所有信息（用户名 密码 邮箱 电话 性别 图片路径 封号状态）
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(User user,HttpServletRequest request){
        userService.updateUser(user);
        User user1=userService.getUserById(user.getId());
        request.getSession().setAttribute("userSession",user1);
        return "index/personal-info";
    }

    /**
     * 更换头像
     * @param id
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("updatePath")
    public String updatePath(int id, MultipartFile file,HttpServletRequest request){
        // 图片上传
        // 设置图片名称，不能重复，可以使用uuid
        String picName = UUID.randomUUID().toString();
        // 获取文件名
        String oriName = file.getOriginalFilename();
        // 获取图片后缀
        String extName = oriName.substring(oriName.lastIndexOf("."));
        // 开始上传
        try {
            file.transferTo(new File("D:/upload/userPath/" + picName + extName));
            /*model.addAttribute("pic",picName + extName);*/
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(id);
        User user=userService.getUserById(id);
        System.out.println(user);
        user.setPhotoPath(picName + extName);
        userService.updateUser(user);
        request.getSession().setAttribute("userSession",user);
        return "index/personal-info";
    }

    @RequestMapping("/updatePwd")
    @ResponseBody
    public String updatePwd(User user,String newPwd1,String newPwd2,HttpServletRequest request){
        User user1=userService.getUserById(user.getId());
        if (user1.getPassword().equals(user.getPassword())){
            if (newPwd1.equals(newPwd2)){
                user1.setPassword(newPwd1);
                userService.updateUser(user1);
                request.getSession().invalidate();
                return "ok";
            }else {
                return "error1";
            }
        }else{
            return "error2";
        }

    }

    /**
     *  // 通过其他查询用户（后台）
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/getUserByOther")
    public String getUserByOther(User user,Model model){
        System.out.println(user);
        List<User> user1=userService.getUserByOther(user);
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
