<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>��������</title>
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

                <dt>��������</dt>

                <dd ><a href="lyb.jsp">��Ҫ����</a></dd>

            </dl>

        </div>

    </div>

</div>



<div class="content">

    <div class="about">

        <div class="about_txt">
		
		
		
		
<% 
    String url = "lyblist.jsp?1=1"; 
    String sql =  "select * from liuyanban  order by id desc";
	//out.print(sql);
	ArrayList<HashMap> list = PageManager.getPages(url,4,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
                          <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#6EA6C1" class="tb">
                            <!--DWLayoutTable-->
                            <tr>
                              <td width="85" rowspan="4" align="center" valign="middle" bgcolor="#FFFFFF"><img width='70'height='70' src=img/<%=map.get("xingbie") %>.gif border=0> </td>
                              <td height="20" align="left" valign="middle" bgcolor="#FFFFFF">&nbsp; &nbsp; ������:<%=map.get("addtime")%> &nbsp;</td>
                            </tr>
                            <tr>
                              <td height="78" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;<%=map.get("neirong")%></td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp; &nbsp;�ǳƣ�<%=map.get("cheng")%> &nbsp; &nbsp;�绰��<%=map.get("dianhua") %>&nbsp;&nbsp;�� ��:<%=map.get("youxiang")%> &nbsp; QQ:<%=map.get("QQ")%>&nbsp; &nbsp; </td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp; &nbsp;����Ա�ظ���<%=map.get("huifuneirong")%></td>
                            </tr>
                          </table>
                          <%}
						 
						  %>
                          
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









