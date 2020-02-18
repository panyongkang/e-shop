package com.xmut.estore.dao;

import java.sql.SQLException;

import com.xmut.estore.domain.User;

public interface UserDAO {

	/**
	 * 根据用户名获取 User 对象
	 * @param username
	 * @return
	 */
	public abstract User getUser(String username);
	/**
	 * 根据用户名和密码获取User对象
	 * @param username
	 * @param password
	 * @return
	 */
	public abstract User getUsernameAndPassword(String username,String password);

	/**
	 * 判断用户名是否存在
	 * @param username
	 * @return
	 * @throws SQLException 
	 */
	public abstract Boolean isExist(String username) throws SQLException;
}


