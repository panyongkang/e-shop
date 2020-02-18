<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的账号 </title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<%@ include file="/commons/queryCondition.jsp" %>

</head>

<body>
	<%@ include file="/commons/header.jsp"%>
	
	<center>
		<div class="thumbnail">
			<img src="img/tx.jpg" style="width:200px;height:200px;"/>
		</div>
		<div class="caption">
		<br><br>
		<span>用户名：${user.username}</span>
		<br><br>
		<span>密码：${user.password}</span>
		<br><br>
		<span>用户账号: ${user.accountId}</span>
		<br><br>
		<span>当前时间:<%=new Date().toLocaleString() %></span>
		<br><br>
		<span>账号备注: 保密</span>
		<br><br>
		
		<a class="btn btn-primary btn-ms" href="computerServlet?method=getComputers" role="button">返回</a>
		<a href="${pageContext.request.contextPath}/userServlet?method=quitUser" class="btn btn-primary btn-ms" role="button"> 退出</a> 
		</div>
		
	</center>
	<%@ include file="/commons/footer.jsp"%>
</body>
</html>