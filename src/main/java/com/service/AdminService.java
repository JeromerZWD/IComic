package com.service;

import com.entity.Admin;


public interface AdminService {
    //登陆验证
    Admin loginCheck(Admin admin);
    //管理员数量
    int countAdmin();
}
