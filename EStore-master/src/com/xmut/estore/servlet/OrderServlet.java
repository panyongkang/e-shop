package com.xmut.estore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.xmut.estore.domain.User;

public class OrderServlet extends HttpServlet {
	
	/**
	 * 我的订单
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void myOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//从session中拿到order,根据其中的uid查询数据库找到orderList,然后遍历每一个order
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		if(user==null) {
			//用户未登录
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else {
			//用户登陆了
			session.setAttribute("orderList", "用户订单详情...");
			response.sendRedirect(request.getContextPath()+"/order_list.jsp");
	}
}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myOrder(request, response);
	}

	
}
