<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>ע���û���ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"zhuceyonghu");
     %>
  ע���û���ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>�û�����</td><td width='39%'><%=m.get("yonghuming")%></td>
<td width='11%'>���룺</td><td width='39%'><%=m.get("mima")%></td></tr><tr>
<td width='11%'>������</td><td width='39%'><%=m.get("xingming")%></td>
<td width='11%'>�Ա�</td><td width='39%'><%=m.get("xingbie")%></td></tr><tr>
<td width='11%'>���䣺</td><td width='39%'><%=m.get("nianling")%></td>
<td width='11%'>��ϵ��ʽ��</td><td width='39%'><%=m.get("lianxifangshi")%></td></tr><tr>
<td width='11%'>��Ƭ��</td><td width='39%'><%=m.get("zhaopian")%></td>
<td width='11%'>&nbsp;</td>
<td width='39%'>&nbsp;</td>
</tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
  </table>

  </body>
</html>


