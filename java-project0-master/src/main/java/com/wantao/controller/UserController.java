package com.wantao.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mchange.v2.beans.BeansUtils;
import com.wantao.bean.User;
import com.wantao.service.UserService;
 
@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
     private UserService userService;
	//转向登录页面
	@RequestMapping("tologin")
	public String tologin(){
		return "login";	
	}
	/*
	 * //登录验证
	 * 
	 * @RequestMapping(value = "/login",method = RequestMethod.POST) public String
	 * login(@RequestParam("username") String username,
	 * 
	 * @RequestParam("password") String password,HttpSession session){ User
	 * userLogin = new User(); List<User> user=userService.logincheck(userLogin); if
	 * (user.isEmpty()) { session.setAttribute("error",
	 * "用户名或密码错误"); return "login";
	 * 
	 * }else { session.setAttribute("username",username); return "index"; }
	 * 
	 * }
	 */
	

    /**
     * 登录功能
     * @param user
     * @param sess
     * @return
     */
    @RequestMapping("/doLogin")
    public String doLogin(User user, HttpSession sess){
        String username = user.getUsername();
        String password = user.getPassword();
        if(!username.equals("") && !password.equals("")){
            List<User> user1 = userService.logincheck(user);
            //不能使用user1==null,否则用户名和密码不正确也能登录
            if(user1.isEmpty()){
            	sess.setAttribute("error", "账号或者密码错误！");
                return "login";
              
            }else{
            	  sess.setAttribute("user", user1);
                  return "index";
            }
        }
        sess.setAttribute("error", "账号或者密码为空！请输入完整！");
        return "login";
    }

	
	//转向注册页面
	@RequestMapping("/toregister")
	public String toregister(){
		return "registerUser";	
	}
	//注册
	@RequestMapping("/register")
	public String  register(@RequestParam("username") String username,
			@RequestParam("password") String password,Model model){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		userService.register(user);
		model.addAttribute("error", "注册成功，可以登录啦！");
		return "login";
     }
	
	 /**
     * 退出登录
     * @param sess
     * @return
     */
    @RequestMapping("/doLogout")
    public String doLogout(HttpSession session){
        try {
        	session.removeAttribute("username");
        }catch (Exception e){
        }
        try {
        	session.removeAttribute("error");

        }catch (Exception e){
        }
        return "login";
    }

}