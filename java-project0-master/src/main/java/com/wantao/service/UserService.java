package com.wantao.service;

import java.util.List;

import com.wantao.bean.User;

public interface UserService {
	//登录验证
		List<User> logincheck(User user);
		//注册
	    void register(User user);
}
