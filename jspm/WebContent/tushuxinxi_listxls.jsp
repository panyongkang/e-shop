<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=tushuxinxi.xls");
%>
<html>
  <head>
    <title>ͼ����Ϣ</title>
  </head>

  <body >
  <p>����ͼ����Ϣ�б�</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>ͼ����</td>
    <td bgcolor='#CCFFFF'>ͼ������</td>
    <td bgcolor='#CCFFFF'>ͼ�����</td>
    <td bgcolor='#CCFFFF'>���ۼ۸�</td>
    
    <td bgcolor='#CCFFFF' width='90' align='center'>ͼƬ</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ��Ƽ�</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    

  </tr>
  <% 

    String url = "tushuxinxi_list.jsp?1=1"; 
    String sql =  "select * from tushuxinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("tushubianhao") %></td>
    <td><%=map.get("tushumingcheng") %></td>
    <td><%=map.get("tushuleibie") %></td>
    <td><%=map.get("chushoujiage") %></td>
    
    <td width='90' align='center'><a href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    <td><%=map.get("xiaoliang") %></td>
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=tushuxinxi" onClick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=map.get("issh")%></a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
�������ݹ�<%=i %>��
  </body>
</html>

