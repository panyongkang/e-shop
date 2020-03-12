<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>


<META content="MSHTML 6.00.2800.1106" name=GENERATOR>


</HEAD>
<div class="headerCb">

                    <h1 class="logo"><a href="index.jsp"><img src="qtimages/logo.png" alt="" border="0"/></a></h1>

                    <div class="nav">

                        <ul>

<li><a   href='index.jsp'>首页</a></li>





<li><a   href='tushuxinxilisttp.jsp'>图书信息</a></li>

<li><a   href='zhuceyonghuadd.jsp'>用户注册</a></li>

<li><a   href='login.jsp'>后台管理</a></li>

                        </ul>

                    </div>

                </div>
 <div id="nav_products" class="nav_products">

                    <div class="row">
					
					<%
										
    for(HashMap map:new CommDAO().select("select * from tushuxinxi order by id desc ",1,5)){
	
     %>
							<div class="nav_col">
                            <ul class="sub-menu">
                                <li><span class="submenu_tit"><%=map.get("tushuleibie")%></span>
                                    <hr class="submenu_line">
                                    <ul class="sub-menu">
											<%
										
    for(HashMap map2:new CommDAO().select("select * from tushuxinxi where tushuleibie='"+map.get("tushuleibie")+"' order by id desc ",1,4)){
	
     %>
													<li><a href="tushuxinxidetail.jsp?id=<%=map2.get("id")%>"><%=map2.get("tushumingcheng")%></a></li>
													<%
													}
											%>
										                                        
                                                                             
                                                                           </ul>
                                </li>
                            </ul>
                        </div>
							<%
							}
					%>
					
                        
					 
					                



