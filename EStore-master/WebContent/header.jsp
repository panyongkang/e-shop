<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript">
//使用JSON完成导航栏
	$(function(){
		$.post(
			"${pageContext.request.contextPath }/product?method=productCategory",
			function(data){
				var content ="";
				for (var i = 0; i < data.length; i++) {
					content +="<li><a href='${pageContext.request.contextPath}/product?method=product_list&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
				}
				$("#categoryUl").html(content);
				
			},
			"json"
		);
	});


</script>


<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4 cbg">
		<a href="${pageContext.request.contextPath }"><img src="img/Logo.jpg" /></a>
	</div>
	<div class="col-md-5 cbg">
		<img src="img/baozhang.jpg" />
		<img src="img/hf.jfif" />
		<img src="img/wlyt.jpg" />
		<img src="img/VIP.jfif" />
		<img src="img/zy.jfif" />
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline">
			<c:if test="${empty user }">
				<li class="btn btn-default"><a href="login.jsp">登录</a></li>
				<li>|</li>
				<li class="btn btn-default"><a href="register.jsp">注册</a></li>
				<li>|</li>
			</c:if>
			<c:if test="${!empty user }">
				<li class="btn btn-default"><a href="#">${user.username }</a></li>
				<li class="btn btn-default"><a href="${pageContext.request.contextPath }/user?method=quitUser">退出</a></li>
				<li>|</li>
			</c:if>
			<c:if test="${empty user }">
			<li class="btn btn-default"><a href="javascript:alert('请先登录！'); " >购物车</a></li>
			<li>|</li>
			</c:if>
			<c:if test="${!empty user }">
			<li class="btn btn-default"><a href="cart.jsp">购物车</a></li>
			<li>|</li>
			</c:if>
			<li class="btn btn-default" ><a href="javascript:alert('请先登录！');">我的订单</a></li>
		</ol>
	</div>
</div>
<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-default">
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
				<form class="navbar-form navbar-right" role="search" action="http://www.baidu.com/baidu" autocomplete="off">
					<div class="form-group">
						<input name="word" size="40" type="text" class="form-control" placeholder="请输入搜索内容">
					</div>
					<button name="btnSS" type="submit" class="btn btn-info">百度搜索</button>
				</form>
			</div>
		</div>
	</nav>
</div>