package com.mapper;

import com.entity.User;

import java.util.List;

public interface UserMapper {
    // 查询所有用户信息
    List<User> getUsers();
    // 通过其他查询用户（后台）
    List<User>  getUserByOther(User user);
    // 删除用户
    int deleteUserById(Integer id);
    // 修改信息
    int updateUser(User user);
    //注册用户 (注册时用 用户名 账号 密码 注册时间)
    int saveUser(User user);
    //添加用户 （后台用 用户名 账号 密码 电话 邮箱 性别 注册时间）
    int addUser(User user);
    //封号
    int closeUser(int id);
    //查询所有封号的用户信息
    List<User> getCloseUsers();
    //通过用户账号查询封号用户的信息
    List<User> getCloseUserByLoginName(String loginname);
    //解封
    int openUser(int id);
    //查询用户数量
    int countUser();
    //通过用户id查询用户
    User getUserById(int id);
    //登录验证
    User loginCheck(User user);
}
