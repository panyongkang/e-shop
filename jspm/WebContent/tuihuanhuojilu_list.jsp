<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>退换货记录</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有退换货记录列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  订单编号：<input name="dingdanbianhao" type="text" id="dingdanbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  下单人：<input name="xiadanren" type="text" id="xiadanren" style='border:solid 1px #000000; color:#666666' size="12" /> 模式：<select name='moshi' id='moshi' style='border:solid 1px #000000; color:#666666;'><option value="">所有</option><option value="退货">退货</option><option value="换货">换货</option></select>  申请时间：<input name="shenqingshijian1" type="text" id="shenqingshijian1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="shenqingshijian2" type="text" id="shenqingshijian2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='tuihuanhuojilu_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>订单编号</td>    <td bgcolor='#CCFFFF'>下单人</td>    <td bgcolor='#CCFFFF'>模式</td>    <td bgcolor='#CCFFFF' width='95' align='center'>申请时间</td>        <td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
	
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"tuihuanhuojilu"); 
    String url = "tuihuanhuojilu_list.jsp?1=1"; 
    String sql =  "select * from tuihuanhuojilu where 1=1";
	if(request.getParameter("dingdanbianhao")=="" ||request.getParameter("dingdanbianhao")==null ){}else{sql=sql+" and dingdanbianhao like '%"+request.getParameter("dingdanbianhao")+"%'";}if(request.getParameter("xiadanren")=="" ||request.getParameter("xiadanren")==null ){}else{sql=sql+" and xiadanren like '%"+request.getParameter("xiadanren")+"%'";}if(request.getParameter("moshi")=="" ||request.getParameter("moshi")==null ){}else{sql=sql+" and moshi like '%"+request.getParameter("moshi")+"%'";}if (request.getParameter("shenqingshijian1")==""  ||request.getParameter("shenqingshijian1")==null ) {}else{sql=sql+" and shenqingshijian >= '"+request.getParameter("shenqingshijian1")+"'";}if (request.getParameter("shenqingshijian2")==""  ||request.getParameter("shenqingshijian2")==null ) {}else {sql=sql+" and shenqingshijian <= '"+request.getParameter("shenqingshijian2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("dingdanbianhao") %></td>    <td><%=map.get("xiadanren") %></td>    <td><%=map.get("moshi") %></td>    <td><%=map.get("shenqingshijian") %></td>        <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=tuihuanhuojilu" onclick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="tuihuanhuojilu_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="tuihuanhuojilu_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="tuihuanhuojilu_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

