<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�˻�����¼</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>�����˻�����¼�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ������ţ�<input name="dingdanbianhao" type="text" id="dingdanbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  �µ��ˣ�<input name="xiadanren" type="text" id="xiadanren" style='border:solid 1px #000000; color:#666666' size="12" /> ģʽ��<select name='moshi' id='moshi' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><option value="�˻�">�˻�</option><option value="����">����</option></select>  ����ʱ�䣺<input name="shenqingshijian1" type="text" id="shenqingshijian1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="shenqingshijian2" type="text" id="shenqingshijian2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='tuihuanhuojilu_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>�������</td>    <td bgcolor='#CCFFFF'>�µ���</td>    <td bgcolor='#CCFFFF'>ģʽ</td>    <td bgcolor='#CCFFFF' width='95' align='center'>����ʱ��</td>        <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
	
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
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
    <td><%=map.get("dingdanbianhao") %></td>    <td><%=map.get("xiadanren") %></td>    <td><%=map.get("moshi") %></td>    <td><%=map.get("shenqingshijian") %></td>        <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=tuihuanhuojilu" onclick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=map.get("issh")%></a></td>
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="tuihuanhuojilu_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="tuihuanhuojilu_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="tuihuanhuojilu_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

