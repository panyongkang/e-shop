<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>ͼ����Ϣ��ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"tushuxinxi");
     %>
  ͼ����Ϣ��ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>ͼ���ţ�</td><td width='39%'><%=m.get("tushubianhao")%></td><td  rowspan=5 align=center><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>ͼ�����ƣ�</td><td width='39%'><%=m.get("tushumingcheng")%></td></tr><tr><td width='11%' height=44>ͼ�����</td><td width='39%'><%=m.get("tushuleibie")%></td></tr><tr><td width='11%' height=44>���ۼ۸�</td><td width='39%'><%=m.get("chushoujiage")%></td></tr><tr><td width='11%' height=44>������</td><td width='39%'><%=m.get("xiaoliang")%></td></tr><tr><td width='11%' height=100  >��ϸ���ܣ�</td><td width='39%' colspan=2 height=100 ><%=m.get("xiangxijieshao")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


