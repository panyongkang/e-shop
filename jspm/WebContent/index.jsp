<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>



<title>网络精品电子书屋在线交易系统</title>


<link rel="stylesheet" href="css/common.css"/>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

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
<div id="indexVideos" class="videos" style="width:1170px; margin:0px auto;">
  <h1 class="videotit"> <strong>最新图书</strong>  </h1>
  <ul class="plist3">
    <%
										
    for(HashMap map:new CommDAO().select("select * from tushuxinxi  order by addtime desc ",1,4)){
	
     %>
    <li>
      <div class="pic"> <a class="fancybox-media" href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"></a> <img src="<%=map.get("tupian")%>" alt="<%=map.get("tushumingcheng")%>"/> </div>
      <div class="tit"> <a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><%=map.get("tushumingcheng")%></a> </div>
      <div class="info"> <span class="_name"></span> <span class="_title"><%=map.get("tushumingcheng")%></span> </div>
    </li>
    <%
	  }
	  %>
  </ul>
</div>
<div class="content w100" style="background: #fff;">
<div id="indexNews">
  <div class="newsList">
    <div class="newsbox">
      <h1>推荐图书</h1>
      <%
										
    for(HashMap map:new CommDAO().select("select * from tushuxinxi where  issh='是' order by id desc ",1,3)){
	
     %>
      <dl>
        <dt style="width:100px;height:61px"> <a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><img width="100px" height="61px" src="<%=map.get("tupian")%>" alt="<%=map.get("tushumingcheng")%>"/></a> </dt>
        <dd> <strong><a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><%=map.get("tushumingcheng")%>（￥:<%=map.get("chushoujiage")%>元 ）</a></strong> <span><%=map.get("addtime")%> </span></dd>
      </dl>
      <span>
        <%
	  }
	  %>
      </span></div>
    <span>
      <div class="newsbox">
        <h1>热销图书</h1>
        <%
										
    for(HashMap map:new CommDAO().select("select * from tushuxinxi  order by xiaoliang desc ",1,3)){
	
     %>
        <dl>
          <dt style="width:100px;height:61px"> <a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><img width="100px" height="61px" src="<%=map.get("tupian")%>" alt="<%=map.get("tushumingcheng")%>"/></a> </dt>
          <dd> <strong><a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><%=map.get("tushumingcheng")%> （￥:<%=map.get("chushoujiage")%>元 ）</a></strong>（销量:<%=map.get("xiaoliang")%> ）</a></strong> <span><%=map.get("addtime")%> </span></dd>
        </dl>
        <span>
          <%
	  }
	  %>
        </span></div>
      <span>
        <div class="newsbox">
          <div class="newsbox">
            <h1>促销图书</h1>
            <%
										
    for(HashMap map:new CommDAO().select("select * from tushuxinxi order by chushoujiage asc ",1,3)){
	
     %>
            <dl>
              <dt style="width:100px;height:61px"> <a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><img width="100px" height="61px" src="<%=map.get("tupian")%>" alt="<%=map.get("tushumingcheng")%>"/></a> </dt>
              <dd> <strong><a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><%=map.get("tushumingcheng")%> （￥:<%=map.get("chushoujiage")%>元 ）</a></strong> <span><%=map.get("addtime")%> </span></dd>
            </dl>
            <span>
              <%
	  }
	  %>
            </span></div>
        </div>
      </span></span></div>
</div>
<%@ include file="qtdown.jsp"%>




<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

<script type="text/javascript" src="js/banner.js"></script>

<script type="text/javascript" src="js/common.js"></script>

</body>

</html>