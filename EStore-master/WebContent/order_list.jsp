<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>estore百脑汇--只卖正品，顺丰包邮</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		
		$("#pageNo").change(function(){
			var val = $(this).val();
			val = $.trim(val);
			
			//1. 校验 val 是否为数字 1, 2, 而不是 a12, b
			var flag = false;
			var reg = /^\d+$/g;
			var pageNo = 0;
			
			if(reg.test(val)){
				//2. 校验 val 在一个合法的范围内： 1-totalPageNumber
				pageNo = parseInt(val);
				if(pageNo >= 1 && pageNo <= parseInt("${computerpage.totalPageNumber }")){
					flag = true;
				}
			}
			
			
			if(!flag){
				
				$(".alert").alert();
				$(this).val("");
				return;
			}
			
			//3. 页面跳转
			var href = "computerServlet?method=getComputers&pageNo=" + pageNo + "&" + $(":hidden").serialize();
			window.location.href = href;
		});
	})
	
</script>
<script type="text/javascript">

$(function(){
  $("#back-to-top").click(function() {
      $("html,body").animate({scrollTop:0}, 500);
  }); 
 })

</script>
<%@ include file="/commons/queryCondition.jsp" %>
</head>
<body>
		<%@ include file="/commons/header.jsp"%>
		
	<div class="container">
	<div class="row">
		<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
			<strong>我的订单</strong>
			<table class="table table-bordered"><br>
			<span>${orderList }</span>
			<p><a class="btn btn-primary" href="computerServlet?method=getComputers" role="button">返回</a></p>
			</table>
		</div>
	</div>
	<div style="text-align: center;">
		<ul class="pagination">
			<li class="disabled"><a href="#" aria-label="Previous"><span
					aria-hidden="true">&laquo;</span></a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">6</a></li>
			<li><a href="#">7</a></li>
			<li><a href="#">8</a></li>
			<li><a href="#">9</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</div>
</div>
		<%@ include file="/commons/footer.jsp"%>
		
			

	
</body>
</html>