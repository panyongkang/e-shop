package cn.ruanwenjun.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.ruanwenjun.constant.Constant;
import cn.ruanwenjun.domain.User;
import cn.ruanwenjun.service.UserService;
import cn.ruanwenjun.utils.MailUtils;

public class UserServlet extends BasicServlet {
	/**
	 * 用户注册
	 */
	public void userRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 从前台接收数据,并封装成User
		Map<String, String[]> properties = request.getParameterMap();
		User user = new User();
		try {
			BeanUtils.populate(user, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		// 手动封装
		user.setUid(UUID.randomUUID().toString());
		user.setTelephone("123");
		user.setState(0); // 0代表默认是未激活
		String activeCode = UUID.randomUUID().toString(); // 激活码
		user.setCode(activeCode);
		// 将User传给service层进行注册
		UserService service = new UserService();
		boolean isRegister = service.register(user);
		if (isRegister) {
			// 注册成功,发送激活邮件，跳转到激活页面
			try {
				MailUtils.sendMail(user.getEmail(),
						"请点击进行激活<a href='http://localhost:8080/Shop/activeUser?activeCode=" + activeCode + "'>"
								+ "http://localhost:8080/Shop/user?method=activeUser&activeCode=" + activeCode + "</a>");
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/registerSuccess.jsp");
		} else {
			// 注册失败，跳转到失败页面
			response.sendRedirect(request.getContextPath() + "/registerFail.jsp");
		}
	}

	/**
	 * 用户激活
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void activeUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String activeCode = request.getParameter("activeCode");
		UserService service = new UserService();
		int activeUser = service.activeUser(activeCode);
		if (activeUser > 0) {
			// 激活成功
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write("恭喜您，激活成功,点击跳转到登陆页面<a href='" + request.getContextPath() + "login.jsp'></a>");
		} else {
			// 激活失败
			response.getWriter().write("激活失败,请重新激活或联系管理员");
		}
	}

	/**
	 * 用户名是否存在
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void isUsernameExist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		UserService service = new UserService();
		Boolean isExist = service.isExist(username);
		response.getWriter().write("{\"isExist\":" + isExist + "}");
	}

	/**
	 * 用户登录
	 * BeanUtils:
		控制层在接收大量参数的时候，如果一个一个区获取，比较繁琐，
		而且传值得时候，由于参数比较多，编写不方便。此时，我们可以通过Beanutils这个工具。
		这个工具，就可以直接把一个map集合里面的数据，自动封装到一个实体对象里面去。
		在封装过程当中，工具实际上是调用对象的set方法进行的赋值，而且还进行了类型的自动转换。
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void userLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, String[]> properties = request.getParameterMap();
		User loginUser = new User();
		try {
			BeanUtils.populate(loginUser, properties);//直接把一个map集合里面的数据，自动封装到一个实体对象里面去。
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		UserService service = new UserService();
		User user = service.login(loginUser);
		if (user == null) {
			// 表示用户不存在
			request.getSession().setAttribute("loginInfo", "false"); // 将登陆信息存到session中
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} else {
			if (user.getState() == 0) {
				// 表示用户尚未激活
				request.getSession().setAttribute("loginInfo", "notActive");
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			} else {
				// 表示登陆成功
				request.getSession().setAttribute("user", user);
				
	/************************记住用户名：判断是否勾选了记住用户名**************/
				if(Constant.SAVE_NAME.equals(request.getContextPath())) {
					Cookie c= new Cookie("saveName", java.net.URLEncoder.encode(user.getUsername(), "utf-8"));
					c.setMaxAge(Integer.MAX_VALUE);//设置保存时间
					c.setPath(request.getContextPath()+"/");//指定一个路径
					response.addCookie(c);
				}
				
				response.sendRedirect(request.getContextPath());
			}
		}
	}

	public String quitUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 退出当前登陆
		/*写法一：
		 * request.getSession().setAttribute("user", null);
		 * response.sendRedirect(request.getContextPath());
		 */
		//写法二：
		request.getSession().invalidate();//用于清除session的所有信息。
		response.sendRedirect(request.getContextPath());
		return null;
	}

	/**
	 * 验证码验证
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void checkCodeVarify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String checkCode = (String) request.getParameter("checkCode");
		Boolean isRight = checkCode.equals(request.getSession().getAttribute("checkcode_session"));
		response.getWriter().write("{\"isRight\":" + isRight + "}");
	}
}
