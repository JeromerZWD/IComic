package com.service.impl;

import com.entity.User;
import com.mapper.UserMapper;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> getUsers() {
        return userMapper.getUsers();
    }

    @Override
    public List<User> getUserByOther(User user) {
        return userMapper.getUserByOther(user);
    }

    @Override
    public int deleteUserById(Integer id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int saveUser(User user) {
        return userMapper.saveUser(user);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int closeUser(int id) {
        return  userMapper.closeUser(id);
    }

    @Override
    public List<User> getCloseUsers() {
        return userMapper.getCloseUsers();
    }

    @Override
    public List<User> getCloseUserByLoginName(String loginname) {
        return userMapper.getCloseUserByLoginName(loginname);
    }

    @Override
    public int openUser(int id) {
        return userMapper.openUser(id);
    }

    @Override
    public int countUser() {
        return userMapper.countUser();
    }

    @Override
    public User getUserById(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public User loginCheck(User user) {
        return userMapper.loginCheck(user);
    }
}
