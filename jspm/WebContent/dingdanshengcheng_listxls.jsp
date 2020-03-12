<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=dingdanshengcheng.xls");
%>
<html>
  <head>
    <title>订单生成</title>
  </head>

  <body >
  <p>已有订单生成列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>订单编号</td>
    <td bgcolor='#CCFFFF'>金额</td>
    <td bgcolor='#CCFFFF'>下单人</td>
    <td bgcolor='#CCFFFF'>联系方式</td>
    <td bgcolor='#CCFFFF'>地址</td>
    
    <td bgcolor='#CCFFFF'>状态</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>是否支付</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>是否收货</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
  </tr>
  <% 

    String url = "dingdanshengcheng_list.jsp?1=1"; 
    String sql =  "select * from dingdanshengcheng where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("dingdanbianhao") %></td>
    <td><%=map.get("jine") %></td>
    <td><%=map.get("xiadanren") %></td>
    <td><%=map.get("lianxifangshi") %></td>
    <td><%=map.get("dizhi") %></td>
    
    <td><%=map.get("zhuangtai") %></td>
    <td align='center'><%=map.get("iszf")%></td>
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=dingdanshengcheng" onClick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

