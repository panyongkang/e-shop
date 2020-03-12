<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta content="text/html" charset="utf-8">
    <title>注册页面</title>
    <%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
  </head>
  <body>
    <table style="margin:20px auto;border:2px solid blue;">
      <form action="${APP_PATH}/user/register" method="post" autocomplete="off">
        <tr>
          <td>用户名</td>
          <td><input type="text" name="username"></td>
        </tr>

        <tr>
          <td>密码</td>
          <td><input type="password" name="password"></td>
        </tr>

        <tr>
          <td><input type="submit" value="注册"></td>
          <td><a style="text-decoration:none;border:1px solid red;background-color: aqua;color:red;"  href="${APP_PATH}/user/tologin">返回登录</a></td>
        </tr>
      </form>
    </table>
  </body>
</html>

