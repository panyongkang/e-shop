<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>订单生成</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有订单生成列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  订单编号：<input name="dingdanbianhao" type="text" id="dingdanbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  订单内容：<input name="dingdanneirong" type="text" id="dingdanneirong" style='border:solid 1px #000000; color:#666666' size="12" />  下单人：<input name="xiadanren" type="text" id="xiadanren" style='border:solid 1px #000000; color:#666666' size="12" />  联系方式：<input name="lianxifangshi" type="text" id="lianxifangshi" style='border:solid 1px #000000; color:#666666' size="12" />  地址：<input name="dizhi" type="text" id="dizhi" style='border:solid 1px #000000; color:#666666' size="12" />  备注：<input name="beizhu" type="text" id="beizhu" style='border:solid 1px #000000; color:#666666' size="12" /> 状态：<select name='zhuangtai' id='zhuangtai' style='border:solid 1px #000000; color:#666666;'><option value="">所有</option><option value="已下单">已下单</option><option value="已发货">已发货</option></select>
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='dingdanshengcheng_listxls.jsp';" />
</form>

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
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"dingdanshengcheng"); 
    String url = "dingdanshengcheng_list.jsp?1=1"; 
    String sql =  "select * from dingdanshengcheng where 1=1";
	
if(request.getParameter("dingdanbianhao")=="" ||request.getParameter("dingdanbianhao")==null ){}else{sql=sql+" and dingdanbianhao like '%"+request.getParameter("dingdanbianhao")+"%'";}
if(request.getParameter("dingdanneirong")=="" ||request.getParameter("dingdanneirong")==null ){}else{sql=sql+" and dingdanneirong like '%"+request.getParameter("dingdanneirong")+"%'";}
if(request.getParameter("xiadanren")=="" ||request.getParameter("xiadanren")==null ){}else{sql=sql+" and xiadanren like '%"+request.getParameter("xiadanren")+"%'";}
if(request.getParameter("lianxifangshi")=="" ||request.getParameter("lianxifangshi")==null ){}else{sql=sql+" and lianxifangshi like '%"+request.getParameter("lianxifangshi")+"%'";}
if(request.getParameter("dizhi")=="" ||request.getParameter("dizhi")==null ){}else{sql=sql+" and dizhi like '%"+request.getParameter("dizhi")+"%'";}
if(request.getParameter("beizhu")=="" ||request.getParameter("beizhu")==null ){}else{sql=sql+" and beizhu like '%"+request.getParameter("beizhu")+"%'";}
if(request.getParameter("zhuangtai")=="" ||request.getParameter("zhuangtai")==null ){}else{sql=sql+" and zhuangtai like '%"+request.getParameter("zhuangtai")+"%'";}
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
    <td align='center'><%=map.get("issh")%></a></td>
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="dingdanshengcheng_updtlb.jsp?id=<%=map.get("id")%>">设置</a>   <a href="dingdanshengcheng_updt.jsp?id=<%=map.get("id")%>">修改</a>   <a href="dingdanshengcheng_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="dingdanshengcheng_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

