<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
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
</style>
</head>
<script type="text/javascript">
	function delOrderItem(oid){
		
		
		if (confirm("您确定要删除此订单？")) {
			//console.log("获取oid=="+oid);
			window.location ="${pageContext.request.contextPath}/order?method=delOrderItem&oid="+oid;
		}
	}
</script>
<body>


	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<c:if test="${empty orderList }">
		<div style="background-color: #F7F7F7; width: 100%; height: 400px;">
			<div
				style="width:400px; height: 273px; background-image:url('${pageContext.request.contextPath}/images/cart-empty.png');">

			</div>
		</div>
	</c:if>
	<c:if test="${!empty orderList }">
	<div class="container">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<strong>我的订单</strong>
				<table class="table table-bordered">
					<c:forEach items="${ orderList}" var="order">
						<tbody>
							<tr class="success">
								<th colspan="3">订单编号:${order.oid }</th>
								<th colspan="3">下单时间:${order.ordertime }</th>
							</tr>
							<tr class="warning">
								<th class="text-center">图片</th>
								<th class="text-center">商品</th>
								<th class="text-center">价格</th>
								<th class="text-center">数量</th>
								<th class="text-center">小计</th>
								<th class="text-center">操作</th>
							</tr>
							<c:forEach items="${order.list }" var="orderItem">
								<tr class="active">
									<td width="60" width="40%" class="text-center"><input type="hidden" name="id"
										value="22"> <img src="${pageContext.request.contextPath }/${orderItem.product.pimage}" width="70"
										height="60"></td>
									<td width="30%" class="text-center"><a target="_blank"> ${orderItem.product.pname}</a></td>
									<td width="20%" class="text-center">￥${orderItem.product.shop_price}</td>
									<td width="10%" class="text-center">${orderItem.count}</td>
									<td width="15%" class="text-center"><span class="subtotal">￥${orderItem.subTotal}</span></td>
									<td width="15%" class="text-center"><a href="javascript:void(0);" onclick="delOrderItem('${order.oid }')" class="btn btn-danger delete" >删除</a></td>
								</tr>
							</c:forEach>
							<tr class="success">
								<th colspan="6">
									<c:if test="${order.state==1 }">
										已付款
									</c:if>
									<c:if test="${order.state!=1 }">
										未付款
									</c:if>
								</th>
							</tr>
							
						</tbody>
					</c:forEach>
		
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
</c:if>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
	
</body>

</html>