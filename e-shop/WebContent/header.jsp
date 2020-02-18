<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript">
//使用JSON完成导航栏
	$(function(){
		//发送ajax请求，查询所有分类
		//dataType:"json" - 以 JSON 运行响应，并以 JavaScript 对象返回
		$.post(
			"${pageContext.request.contextPath }/product?method=productCategory",
			function(data){
				var content ="";
				for (var i = 0; i < data.length; i++) {//遍历json列表，获取每一个分类，包装成li标签
					content +="<li><a href='${pageContext.request.contextPath}/product?method=product_list&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
				}
				//插入到ul内部
				$("#categoryUl").html(content);
				
			},
			"json"
		);
	});

function myFunction(x){
	x.style.background="yellow";
}

</script>


<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="img/logo2.png" />
	</div>
	<div class="col-md-5">
		<img src="img/header.png" />
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline">
			<c:if test="${empty user }">
				<li><a href="login.jsp">登录</a></li>
				<li><a href="register.jsp">注册</a></li>
			</c:if>
			<c:if test="${!empty user }">
				<li><a href="#">欢迎${user.username }光临！</a></li>
				<li><a href="${pageContext.request.contextPath }/user?method=quitUser">退出</a></li>
			</c:if>
			<li><a href="cart.jsp">购物车</a></li>
			<li><a href="${pageContext.request.contextPath }/order?method=myOrder">我的订单</a></li>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath }">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="categoryUl">
					
				</ul>
				<form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/product?method=product_info">
					<div class="form-group">
						<input onfocus="myFunction(this)" size="40" maxlength="20" type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-info">搜	索</button>
				</form>
			</div>
		</div>
	</nav>
</div>