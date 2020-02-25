<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>图书信息详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"tushuxinxi");
     %>
  图书信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>图书编号：</td><td width='39%'><%=m.get("tushubianhao")%></td><td  rowspan=5 align=center><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>图书名称：</td><td width='39%'><%=m.get("tushumingcheng")%></td></tr><tr><td width='11%' height=44>图书类别：</td><td width='39%'><%=m.get("tushuleibie")%></td></tr><tr><td width='11%' height=44>出售价格：</td><td width='39%'><%=m.get("chushoujiage")%></td></tr><tr><td width='11%' height=44>销量：</td><td width='39%'><%=m.get("xiaoliang")%></td></tr><tr><td width='11%' height=100  >详细介绍：</td><td width='39%' colspan=2 height=100 ><%=m.get("xiangxijieshao")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


