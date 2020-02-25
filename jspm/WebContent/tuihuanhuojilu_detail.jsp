<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>退换货记录详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"tuihuanhuojilu");
     %>
  退换货记录详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>订单编号：</td><td width='39%'><%=m.get("dingdanbianhao")%></td><td width='11%'>下单人：</td><td width='39%'><%=m.get("xiadanren")%></td></tr><tr><td width='11%'>模式：</td><td width='39%'><%=m.get("moshi")%></td><td width='11%'>申请时间：</td><td width='39%'><%=m.get("shenqingshijian")%></td></tr><tr><td width='11%'>申请原因：</td><td width='39%'><%=m.get("shenqingyuanyin")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


