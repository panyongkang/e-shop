package com.wantao.dao;

import java.util.List;

import com.wantao.bean.User;

public interface UserMapper {
	//登录验证
	List<User> logincheck(User user);
	//注册
    void register(User user);
}