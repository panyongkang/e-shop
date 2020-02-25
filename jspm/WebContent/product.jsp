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

                <dt>所有产品</dt>
			 <%
										
    for(HashMap map:new CommDAO().select("select * from tushuxinxi order by id desc ")){
	
     %>
					
                <dd ><a href="#miaodian<%=map.get("id")%>"><%=map.get("tushuleibie")%></a></dd>
 <%}
						  %>
               

                

            </dl>

        </div>

    </div>

</div>

<div class="content">



    <div class="solution w1140">

       
		
		
					 <%
										
    for(HashMap map:new CommDAO().select("select * from tushuxinxi order by id desc ")){
	
     %>
		<a name="miaodian<%=map.get("id")%>" id="miaodian<%=map.get("id")%>"></a>
        <div class="prodata_box">

            <div class="comTit2">

                <h4 class="comTit2_name"><%=map.get("tushuleibie")%> </h4>

          </div>



            <div class="prodata3_list col3">

										
					 <%
										
    for(HashMap map2:new CommDAO().select("select * from tushuxinxi where tushuleibie='"+map.get("tushuleibie")+"' order by id desc ")){
	
     %>
										
		<div class="prodata3_item">		

                    <div class="pic"><a href="tushuxinxidetail.jsp?id=<%=map2.get("id")%>"><img src="<%=map2.get("tupian")%>" alt="" border="0"/></a></div>

                    <div class="tit"><a href="tushuxinxidetail.jsp?id=<%=map2.get("id")%>"><%=map2.get("tushumingcheng")%>(￥:<%=map2.get("chushoujiage")%>元)</a></div>

                    <div class="intro"> <%=map2.get("xiangxijieshao")%></div>		

                    <div class="links">

                

                    </div>

                </div>
				 <%
						 
						}
						  %>
				

         </div>

           </div>

 <%
						}
						 %>



    </div>

</div>



<%@ include file="qtdown.jsp"%>





<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/common.js"></script>

</body>

</html>
