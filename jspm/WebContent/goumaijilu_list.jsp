<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>购买记录</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有购买记录列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  图书编号：<input name="tushubianhao" type="text" id="tushubianhao" style='border:solid 1px #000000; color:#666666' size="12" />  图书名称：<input name="tushumingcheng" type="text" id="tushumingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  图书类别：<input name="tushuleibie" type="text" id="tushuleibie" style='border:solid 1px #000000; color:#666666' size="12" />  出售价格：<input name="chushoujiage" type="text" id="chushoujiage" style='border:solid 1px #000000; color:#666666' size="12" />  销量：<input name="xiaoliang" type="text" id="xiaoliang" style='border:solid 1px #000000; color:#666666' size="12" />  购买数量：<input name="goumaishuliang1" type="text" id="goumaishuliang1"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />-<input name="goumaishuliang2" type="text" id="goumaishuliang2"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />  金额：<input name="jine" type="text" id="jine" style='border:solid 1px #000000; color:#666666' size="12" />  购买时间：<input name="goumaishijian1" type="text" id="goumaishijian1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="goumaishijian2" type="text" id="goumaishijian2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />  购买人：<input name="goumairen" type="text" id="goumairen" style='border:solid 1px #000000; color:#666666' size="12" />  姓名：<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='goumaijilu_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>图书编号</td>
    <td bgcolor='#CCFFFF'>图书名称</td>
    <td bgcolor='#CCFFFF'>图书类别</td>
    <td bgcolor='#CCFFFF'>出售价格</td>
    <td bgcolor='#CCFFFF'>销量</td>
    <td bgcolor='#CCFFFF'>购买数量</td>
    <td bgcolor='#CCFFFF'>金额</td>
    <td bgcolor='#CCFFFF' width='95' align='center'>购买时间</td>
    <td bgcolor='#CCFFFF'>购买人</td>
    <td bgcolor='#CCFFFF'>姓名</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>是否下单</td>
	
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	double jinez=0;


  	 new CommDAO().delete(request,"goumaijilu"); 
    String url = "goumaijilu_list.jsp?1=1"; 
    String sql =  "select * from goumaijilu where 1=1";
	
if(request.getParameter("tushubianhao")=="" ||request.getParameter("tushubianhao")==null ){}else{sql=sql+" and tushubianhao like '%"+request.getParameter("tushubianhao")+"%'";}
if(request.getParameter("tushumingcheng")=="" ||request.getParameter("tushumingcheng")==null ){}else{sql=sql+" and tushumingcheng like '%"+request.getParameter("tushumingcheng")+"%'";}
if(request.getParameter("tushuleibie")=="" ||request.getParameter("tushuleibie")==null ){}else{sql=sql+" and tushuleibie like '%"+request.getParameter("tushuleibie")+"%'";}
if(request.getParameter("chushoujiage")=="" ||request.getParameter("chushoujiage")==null ){}else{sql=sql+" and chushoujiage like '%"+request.getParameter("chushoujiage")+"%'";}
if(request.getParameter("xiaoliang")=="" ||request.getParameter("xiaoliang")==null ){}else{sql=sql+" and xiaoliang like '%"+request.getParameter("xiaoliang")+"%'";}
if (request.getParameter("goumaishuliang1")==""  ||request.getParameter("goumaishuliang1")==null ) {}else{sql=sql+" and goumaishuliang >= '"+request.getParameter("goumaishuliang1")+"'";}
if (request.getParameter("goumaishuliang2")==""  ||request.getParameter("goumaishuliang2")==null ) {}else {sql=sql+" and goumaishuliang <= '"+request.getParameter("goumaishuliang2")+"'";}
if(request.getParameter("jine")=="" ||request.getParameter("jine")==null ){}else{sql=sql+" and jine like '%"+request.getParameter("jine")+"%'";}
if (request.getParameter("goumaishijian1")==""  ||request.getParameter("goumaishijian1")==null ) {}else{sql=sql+" and goumaishijian >= '"+request.getParameter("goumaishijian1")+"'";}
if (request.getParameter("goumaishijian2")==""  ||request.getParameter("goumaishijian2")==null ) {}else {sql=sql+" and goumaishijian <= '"+request.getParameter("goumaishijian2")+"'";}
if(request.getParameter("goumairen")=="" ||request.getParameter("goumairen")==null ){}else{sql=sql+" and goumairen like '%"+request.getParameter("goumairen")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	jinez=jinez+Float.valueOf((String)map.get("jine")).floatValue();



     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("tushubianhao") %></td>
    <td><%=map.get("tushumingcheng") %></td>
    <td><%=map.get("tushuleibie") %></td>
    <td><%=map.get("chushoujiage") %></td>
    <td><%=map.get("xiaoliang") %></td>
    <td><%=map.get("goumaishuliang") %></td>
    <td><%=map.get("jine") %></td>
    <td><%=map.get("goumaishijian") %></td>
    <td><%=map.get("goumairen") %></td>
    <td><%=map.get("xingming") %></td>
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=goumaijilu" onClick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="goumaijilu_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="goumaijilu_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="goumaijilu_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
共计金额:<%=jinez%>；  
${page.info }


  </body>
</html>

