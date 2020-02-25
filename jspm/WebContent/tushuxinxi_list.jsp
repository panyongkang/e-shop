<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>图书信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有图书信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  图书编号：<input name="tushubianhao" type="text" id="tushubianhao" style='border:solid 1px #000000; color:#666666' size="12" />  图书名称：<input name="tushumingcheng" type="text" id="tushumingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  图书类别：<%=Info.getselect("tushuleibie","tushuleibie","leibie"," 1=1 ")%>  出售价格：<input name="chushoujiage1" type="text" id="chushoujiage1"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />-<input name="chushoujiage2" type="text" id="chushoujiage2"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='tushuxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>图书编号</td>
    <td bgcolor='#CCFFFF'>图书名称</td>
    <td bgcolor='#CCFFFF'>图书类别</td>
    <td bgcolor='#CCFFFF'>出售价格</td>
    
    <td bgcolor='#CCFFFF' width='90' align='center'>图片</td>
    <td bgcolor='#CCFFFF'>销量</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>是否推荐</td>
	<td width="90" align="center" bgcolor="#CCFFFF">评论管理</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"tushuxinxi"); 
    String url = "tushuxinxi_list.jsp?1=1"; 
    String sql =  "select * from tushuxinxi where 1=1";
	
if(request.getParameter("tushubianhao")=="" ||request.getParameter("tushubianhao")==null ){}else{sql=sql+" and tushubianhao like '%"+request.getParameter("tushubianhao")+"%'";}
if(request.getParameter("tushumingcheng")=="" ||request.getParameter("tushumingcheng")==null ){}else{sql=sql+" and tushumingcheng like '%"+request.getParameter("tushumingcheng")+"%'";}
if(request.getParameter("tushuleibie")=="" ||request.getParameter("tushuleibie")==null ){}else{sql=sql+" and tushuleibie like '%"+request.getParameter("tushuleibie")+"%'";}
if (request.getParameter("chushoujiage1")==""  ||request.getParameter("chushoujiage1")==null ) {}else{sql=sql+" and chushoujiage >= '"+request.getParameter("chushoujiage1")+"'";}
if (request.getParameter("chushoujiage2")==""  ||request.getParameter("chushoujiage2")==null ) {}else {sql=sql+" and chushoujiage <= '"+request.getParameter("chushoujiage2")+"'";}
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
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=tushuxinxi" onClick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>
	<td width="90" align="center"><a href="pinglun_list.jsp?id=<%=map.get("id")%>&biao=tushuxinxi">评论管理</a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="tushuxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="tushuxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

