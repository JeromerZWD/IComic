package com.service.impl;

import com.entity.Admin;
import com.mapper.AdminMapper;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin logincheck(Admin admin) {
        return adminMapper.logincheck(admin);
    }

    @Override
    public int countAdmin() {
        return adminMapper.countAdmin();
    }
}
