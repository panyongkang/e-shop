<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>����������ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"dingdanshengcheng");
     %>
  ����������ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>������ţ�</td><td width='39%'><%=m.get("dingdanbianhao")%></td><td width='11%'>�������ݣ�</td><td width='39%'><%=m.get("dingdanneirong")%></td></tr><tr><td width='11%'>�µ��ˣ�</td><td width='39%'><%=m.get("xiadanren")%></td><td width='11%'>��ϵ��ʽ��</td><td width='39%'><%=m.get("lianxifangshi")%></td></tr><tr><td width='11%'>��ַ��</td><td width='39%'><%=m.get("dizhi")%></td><td width='11%'>��ע��</td><td width='39%'><%=m.get("beizhu")%></td></tr><tr><td width='11%'>״̬��</td><td width='39%'><%=m.get("zhuangtai")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


