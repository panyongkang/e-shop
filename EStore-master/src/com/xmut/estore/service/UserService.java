package com.xmut.estore.service;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.Set;

import com.xmut.estore.dao.ComputerDAO;
import com.xmut.estore.dao.TradeDAO;
import com.xmut.estore.dao.TradeItemDAO;
import com.xmut.estore.dao.UserDAO;
import com.xmut.estore.dao.impl.ComputerDAOImpl;
import com.xmut.estore.dao.impl.TradeDAOImpl;
import com.xmut.estore.dao.impl.TradeItemDAOImpl;
import com.xmut.estore.dao.impl.UserDAOImpl;
import com.xmut.estore.domain.Trade;
import com.xmut.estore.domain.TradeItem;
import com.xmut.estore.domain.User;

public class UserService {

	private UserDAO userDAO = new UserDAOImpl();
	
	/**
	 * 通过用户名获取User对象
	 * @param username
	 * @return
	 */
	public User getUserByUserName(String username){
		return userDAO.getUser(username);
	}
	
	/**
	 * 通过用户名和密码获取User对象
	 * @param username
	 * @param password
	 * @return
	 */
	public User getUserByUserNameAndPassword(String username,String password){
		return userDAO.getUsernameAndPassword(username, password);
	}
	
	private TradeDAO tradeDAO = new TradeDAOImpl();
	private TradeItemDAO tradeItemDAO = new TradeItemDAOImpl();
	private ComputerDAO computerDAO = new ComputerDAOImpl();
	
	public User getUserWithTrades(String username){
	
//		���� UserDAO �ķ�����ȡ User ����
		User user = userDAO.getUser(username);
		if(user == null){
			return null;
		}
		
//		���� TradeDAO �ķ�����ȡ Trade �ļ��ϣ�����װ��Ϊ User ������
		int userId = user.getUserId();
		
//		���� TradeItemDAO �ķ�����ȡÿһ�� Trade �е� TradeItem �ļ��ϣ�������װ��Ϊ Trade ������
		Set<Trade> trades = tradeDAO.getTradesWithUserId(userId);
		
		if(trades != null){
			Iterator<Trade> tradeIt = trades.iterator();
			
			while(tradeIt.hasNext()){
				Trade trade = tradeIt.next();
				
				int tradeId = trade.getTradeId();
				Set<TradeItem> items = tradeItemDAO.getTradeItemsWithTradeId(tradeId);
				
				if(items != null){
					for(TradeItem item: items){
						item.setComputer(computerDAO.getComputer(item.getComputerId())); 
					}
					
					if(items != null && items.size() != 0){
						trade.setItems(items);						
					}
				}
				
				if(items == null || items.size() == 0){
					tradeIt.remove();	
				}
				
			}
		}
		
		if(trades != null && trades.size() != 0){
			user.setTrades(trades);			
		}
		
		return user;
	}


	/**
	 * 用户名是否存在
	 * @param username
	 * @return
	 * @throws SQLException 
	 */
	public Boolean isExist(String username) throws SQLException {
		UserDAO dao=new UserDAOImpl();
		Boolean isExist = false;
		isExist = dao.isExist(username);
		return isExist;
	}
	
}
