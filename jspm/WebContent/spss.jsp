<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>������ϸ</title>
    <link rel="stylesheet" href="css/common.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /></head>

<body>
<div class="header">
    <div class="headerBox">
        <%@ include file="qttop2.jsp"%>
        <div class="headerCont iscrollAnchor">
            <div class="headerC">
                 <%@ include file="qttop.jsp"%>
            </div>
        </div>
    </div>
</div>
<%@ include file="bht.jsp"%>

<div class="subNav iscrollAnchor">

    <div class="subNavbox">

        <div class="subNavcont">

            <dl>

                <dt>ͼ��չʾ</dt>

                <dd class="current"></dd>

            </dl>

        </div>

    </div>

</div>



<div class="content">

    <div class="about">

        <div class="about_txt">
		
		
		
		

						  <form name="form1" id="form1" method="post" action="">
   ����:  ͼ���ţ�<input name="shangpinbianhao" type="text" id="shangpinbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  ͼ�����ƣ�<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  ͼ�����<%=Info.getselect("shangpinleibiepinpai","shangpinleibiepinpai","shangpinleibiepinpai"," 1=1 ")%>
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
						  </form>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>ͼ����</td>
    <td bgcolor='#CCFFFF'>ͼ������</td>
    <td bgcolor='#CCFFFF'>ͼ�����</td>
    <td bgcolor='#CCFFFF'>���ۼ۸�</td>
    <td bgcolor='#CCFFFF'>���</td>
    <td bgcolor='#CCFFFF' width='90' align='center'>��Ƭ</td>
    
    
    
    <td width="30" align="center" bgcolor="CCFFFF">��ϸ</td>
  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"shangpinxinxi"); 
    String url = "shangpinxinxilist.jsp?1=1"; 
    String sql =  "select * from shangpinxinxi where 1=1";
	
if(request.getParameter("shangpinbianhao")=="" ||request.getParameter("shangpinbianhao")==null ){}else{sql=sql+" and shangpinbianhao like '%"+request.getParameter("shangpinbianhao")+"%'";}
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{sql=sql+" and shangpinmingcheng like '%"+request.getParameter("shangpinmingcheng")+"%'";}
if(request.getParameter("shangpinleibiepinpai")=="" ||request.getParameter("shangpinleibiepinpai")==null ){}else{sql=sql+" and shangpinleibiepinpai like '%"+request.getParameter("shangpinleibiepinpai")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("shangpinbianhao") %></td><td><%=map.get("shangpinmingcheng") %></td><td><%=map.get("shangpinleibiepinpai") %></td><td><%=map.get("xiaoshoujiage") %></td><td><%=map.get("kucun") %></td><td width='90'><a href='<%=map.get("zhaopian") %>' target='_blank'><img src='<%=map.get("zhaopian") %>' width=88 height=99 border=0 /></a></td>
    
    <td width="30" align="center"> <a href="shangpinxinxidetail.jsp?id=<%=map.get("id")%>" >��ϸ</a></td>
  </tr>
  	<%
  }
   %>
</table><br>

<!--yoxugonxgzitoxnxgjxi--> <!--youzuiping3--> 
${page.info }	
                         




        </div>

    </div>

</div>



<%@ include file="qtdown.jsp"%>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

<script type="text/javascript" src="js/banner.js"></script>

<script type="text/javascript" src="js/common.js"></script>

</body>

</html>









