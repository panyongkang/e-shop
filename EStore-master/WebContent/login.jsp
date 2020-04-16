<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>百脑风暴入口</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.container{
	background:#FF2C4C url('images/bj.jfif')no-repeat;  
    width:100%;height:460px;  
    background-size:100% 100%;
}
.error{
	color: red;

}

.VIPlogin{
	with:100%;
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 55px;
	text-align:center;
	margin-bottom:10px;
}
.zxtp img{
	float:left;
	height:200px;
}
</style>
<script type="text/javascript">
	function changeCheckImg(obj) {
		$(obj).attr("src","${pageContext.request.contextPath }/checkImg?date="+new Date());
	}
	$(function(){
		//自定义校验规则------验证码是否正确
		$.validator.addMethod("isRight",function(value,element,params){
			var varify = false;
			$.ajax({
				//设置为同步校验
				async:false,
				dataType:"json",
				type:"POST",
				data:{"checkCode":value},
				url:"${pageContext.request.contextPath }/userServlet?method=checkCodeVarify",
				success:function(data){
					varify = data.isRight;
				}
			});
			return varify;
		});
		$("#loginForm").validate({
			rules:{
				username:{
					required:true
				},
				password:{
					required:true
				},
				checkCode:{
					required:true,
					isRight:true
				}
				
			},
			messages:{
				username:{
					required:"请输入用户名"
				},
				password:{
					required:"请输入密码"
				},
				checkCode:{
					required:"请输入验证码",
					isRight:"验证码不正确"
				}
				
			}
		});
	});



</script>
</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
			</div>

			<div class="col-md-5">
				<div
					style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #f4f4f4;">
					<div class="VIPlogin">会员登录</div>
					<form autocomplete="off" class="form-horizontal" id="loginForm" method="post" action="${pageContext.request.contextPath }/userServlet?method=userLogin">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username" name="username"
									placeholder="请输入用户名">
							</div>
							<c:if test="${EEE=='false'}">
							<p>用户名不匹配</p>
							</c:if>
							<label id="username-error" class="error" for="username"> </label>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="password" name="password"
									placeholder="请输入密码">
							</div>
							<c:if test="${FFF=='notPassword'}">
							<p>密码不匹配</p>
							</c:if>
							<label id="password-error" class="error" for="password"> </label>
						</div>
						<div class="form-group">
							<label for="checkCode" class="col-sm-2 control-label">验证码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="checkCode" name="checkCode"
									placeholder="请输入验证码">
							</div>
							<div class="col-sm-3">
								<img src="${pageContext.request.contextPath }/checkImg" onclick="changeCheckImg(this)" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"> 自动登录
									</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
										type="checkbox" name="savename" value="ok"> 记住用户名
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-10">
								<input type="submit" width="100" value="登录" name="submit"
									style="background: url('./images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 最新商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>最新商品&nbsp;&nbsp;<img src="img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="img/big01.jpg" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
						<a href="product_info.htm">
							<img src="img/middle01.jpg" width="516px" height="200px" style="display: inline-block;">
						</a>
					</div>
				<div class="zxtp">
				<a href="#"><img alt="电脑" src="images/1.jpg"></a>
				<a href="#"><img alt="电脑" src="images/2.jpg"></a>
				<a href="#"><img alt="电脑" src="images/3.jpg"></a>
				<a href="#"><img alt="电脑" src="images/4.jpg"></a>
				<a href="#"><img alt="电脑" src="images/5.jpg"></a>
				<a href="#"><img alt="电脑" src="images/6.jpg"></a>
				<a href="#"><img alt="电脑" src="images/7.jpg"></a>
				<a href="#"><img alt="电脑" src="images/8.jpg"></a>
				<a href="#"><img alt="电脑" src="images/9.jpg"></a>
				</div>
				</div>
			</div>
			
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
<script type="text/javascript">
	var val="${cookie.saveName.value}";
	$("#username").value=decodeURI(val);//decodeURI()用于解码
</script>
</html>