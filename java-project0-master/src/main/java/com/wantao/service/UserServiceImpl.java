package com.wantao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wantao.bean.User;
import com.wantao.dao.UserMapper;
 

@Service
public class UserServiceImpl implements UserService {
   //属性注入
   @Autowired
   private UserMapper usermapper;
 
	@Override
	public List<User> logincheck(User user) {
		List<User> u = usermapper.logincheck(user);
		return u;
	}
 
	@Override
	public void register(User user) {
		usermapper.register(user);
		
	}
 
}