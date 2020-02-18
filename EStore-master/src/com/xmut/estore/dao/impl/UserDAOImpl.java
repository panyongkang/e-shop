package com.xmut.estore.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.xmut.estore.dao.UserDAO;
import com.xmut.estore.db.DataSourceUtils;
import com.xmut.estore.domain.User;


public class UserDAOImpl extends BaseDAO<User> implements UserDAO {

	@Override
	public User getUser(String username) {
		String sql = "SELECT userId, username, accountId " +
				"FROM userinfo WHERE username = ?";
		return query(sql, username); 
	}

	@Override
	public User getUsernameAndPassword(String username, String password) {
		String sql = "SELECT userId, username,password, accountId " +
				"FROM userinfo WHERE username = ? and password=?";
		return query(sql, username,password); 
	}

	/**
	 * 判断用户名是否存在
	 */
	@Override
	public Boolean isExist(String username) throws SQLException {
		String sql = "select count(*) from userinfo where username=?";
		User user = query(sql, username);
		return user!=null?true:false;
	}

}
