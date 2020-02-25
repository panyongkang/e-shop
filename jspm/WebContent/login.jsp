<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>登录</title>
<link rel="stylesheet" type="text/css" href="images/public.css" />
<link rel="stylesheet" type="text/css" href="images/page.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:610px;
	height:52px;
	z-index:1;
	left: 179px;
	top: 243px;
}
-->
</style>
</head>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("验证码错误");
 <%}%>
 
 popheight = 39;

function check()
{
	if(document.form1.username.value=="" || document.form1.pwd.value=="" || document.form1.rand.value=="")
	{
		alert('请输入完整');
		return false;
	}
}

           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 

           
           </script>  
<body>

	<!-- 登录body -->
	<div class="logDiv">
		<img class="logBanner" src="images/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1" style="width:100%;text-align:center;">登录</p>
			</div>
			<!-- 输入框 -->
			
			   <form name="form1" method="post" action="jspm?ac=adminlogin&a=a">
			<div class="lgD">
				<img class="img1" src="images/logName.png" /><input type="text" id="username" name="username" placeholder="输入用户名" />
			</div>
			<div class="lgD">
				<img class="img1" src="images/logPwd.png" /><input  placeholder="输入用户密码" name="pwd" type="password" id="pwd" />
			</div>
		  <div class="lgD">权限:&nbsp;&nbsp;<select name="cx" id="cx" style="width:170px; height:40px;">
            <option value="管理员">管理员</option>
			<option value="学生信息">学生信息</option>
			<option value="教师信息">教师信息</option>
          </select></div>
		  <div class="lgD">
				<img class="img1" src="images/logPwd.png" /><input type="text" placeholder="验证码" name="pagerandom" id="pagerandom" style="width:100px; height:40px;" />&nbsp;<a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="80" height="40" border="0" align="absmiddle" > </a>
			</div>
			<div class="logC"> <input name="login" type="hidden" id="login" value="1">
				<input type="submit" name="Submit" value="登录" onClick="return check();" style="width:320px; height:40px;">
			</div>
			 </form>
		</div>
</div>
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<div class="logFoot">
		<p class="p1">版权所有：网络精品电子书屋在线交易系统</p>
		
	</div>
	<!-- 登录页面底部end -->
   
</body>
</html>



