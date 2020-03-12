<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>


<title>网络精品电子书屋在线交易系统</title>



<link rel="stylesheet" href="css/common.css"/>


</head>

<body>
<%
  String lb=request.getParameter("lb");
%>
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

      <ul>

        <li><a class="current" href='news.jsp?lb=<%=lb%>'><%=lb%></a></li>

      

      </ul>

    </div>

  </div>

</div>

<div class="content">

  <div class="newsPage">

    <div class="newsLeft">

      <div class="news">
	  
	   <% 
    String url = "news.jsp?lb="+lb; 
    String sql =  "select * from xinwentongzhi where leibie='"+lb+"' ";
	if(request.getParameter("keyword")=="" ||request.getParameter("keyword")==null ){}else{sql=sql+" and biaoti like '%"+request.getParameter("keyword").trim()+"%'";}

    sql+=" order by shouyetupian desc, id desc";
	//out.print(sql);
	ArrayList<HashMap> list = PageManager.getPages(url,20,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
	   <div class="newsItem">

          <div class="newsItem_pic"> <a href="gg_detail.jsp?id=<%=map.get("id")%>" class="a-img" ><%
		if (map.get("shouyetupian")==null || map.get("shouyetupian").equals("") || map.get("shouyetupian").equals("null"))
		{
	
	%>
	
	<img src='images/nopic.jpg' width='220' height='145' border='0'>
	<%
	}
	else
	{
	%>
	
	<img src='<%=map.get("shouyetupian")%>' width='220' height='145' border='0'>
	<%
	}
	%></a> </div>

          <div class="newsItem_txt">

            <h4 class="_tit"> <a href="gg_detail.jsp?id=<%=map.get("id")%>" ><%=map.get("biaoti")%></a> </h4>

            <div class="_time">

              <time><%=map.get("addtime")%></time>

            </div>

           

        </div>
		     <%
  }
   %>
					   </div>

      <div class="pages">
	  

${page.info }

</div>

			

    </div>

    <div class="newsRight">  </div>

  </div>

</div>

<!--#include file="qtdown.asp"-->





<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

<script type="text/javascript" src="js/banner.js"></script>

<script type="text/javascript" src="js/common.js"></script>

<style type="text/css">

.pages li{display:inline}

</style>

</body>

</html>

