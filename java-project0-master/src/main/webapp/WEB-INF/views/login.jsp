<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<!-- 指定工程路径 -->
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	//out.print("打印"+request.getContextPath());
%>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"></link>
</head>
<body>
<div class="text-center" style="width: 300px;height: 200px;border: 2px solid blue;margin-top: 20px;">
	<p>管理员登录</p>
	<form action="${APP_PATH}/user/doLogin" method="post" autocomplete="on">
		<p><input type="text" name="username" id="username" placeholder="请输入用户名" value="" ></p>
		<p><input type="password" name="password" id="password" placeholder="请输入密码" value=""></p>
		<input class="btn btn-primary" type="submit" value="登录" id="login">
		<a href="${APP_PATH}/user/toregister" class="btn btn-primary">用户注册</a>		
	</form>
	<p>${error}</p>
	
</div>
</body>
</html>