package com.xmut.estore.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sun.xml.internal.bind.v2.runtime.output.Encoded;
import com.xmut.estore.constant.Constant;
import com.xmut.estore.domain.User;
import com.xmut.estore.service.UserService;
/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserService userService = new UserService();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//method反射机制调用方法
		String methodName = request.getParameter("method");
		
		try {
			// 利用反射获取方法
			Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			// 执行相应的方法
			method.setAccessible(true);
			method.invoke(this, request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	  @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	  
		/**
		 * 
		 * 用户登录
		 * @param request
		 * @param response
		 * @throws IOException
		 * @throws ServletException
		 */
		public void userLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
//			获取 username 请求参数的值
			String username = request.getParameter("username");
			String password=request.getParameter("password");
			//User user=userService.getUserByUserName(username);
			User user=userService.getUserByUserNameAndPassword(username, password);
			
		  if(user==null){
			  request.getSession().setAttribute("EEE", "false");
			  request.getSession().setAttribute("FFF", "notPassword");
			  response.sendRedirect(request.getContextPath()+"/login.jsp");
		  
		  }else { 
			  request.getSession().setAttribute("user", user);
			  /**
			   * 记住用户名：判断是否勾选记住用户名
			   */
			  if(Constant.SAVE_NAME.equals(request.getContextPath())) {
				  // URLEncoder.encode()方法是对username是中文时进行编码
				  Cookie c =new Cookie("saveName", URLEncoder.encode(username, "utf-8"));
				  c.setMaxAge(Integer.MAX_VALUE);
				  c.setPath(request.getContextPath()+"/");
				  response.addCookie(c);
			  }
			  request.getRequestDispatcher("/index.jsp").forward(request, response); }
		 
		}
		
		/**
		 * 输入的验证码验证是否正确
		 * @param request
		 * @param response
		 * @throws IOException
		 */
	public void checkCodeVarify(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String checkCode = (String) request.getParameter("checkCode");
			Boolean isRight = checkCode.equals(request.getSession().getAttribute("checkcode_session"));
			response.getWriter().write("{\"isRight\":" + isRight + "}");
	}
	
	/**
	 * 用户注册
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//从前台接受数据并封装成User
		System.out.println("进入方法");
		Map<String, String[]> properties =request.getParameterMap();
		System.out.println("打印方法"+properties);
		/*
		 * User user= new User(); try { BeanUtils.populate(user, properties); } catch
		 * (IllegalAccessException | InvocationTargetException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
		
	}
	
	/**
	 * 用户名是否存在
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws SQLException 
	 */
	public void isUsernameExist(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		String username = request.getParameter("username");
		UserService service = new UserService();
		Boolean isExist = service.isExist(username);
		response.getWriter().write("{\"isExist\":" + isExist + "}");
	}
		
	  /**
	   * 用户退出
	   * @param request
	   * @param response
	   * @throws IOException
	   */
	public void quitUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
			// 退出当前登陆
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
	 
}
