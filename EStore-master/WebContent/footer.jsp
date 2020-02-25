<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-fluid">
	<div style="margin-top:50px;background:rgba(0, 0, 0, .075);">
	<ul class="text-center list-inline mod_service_unit">
			<li><p class="mod_service_txt">品类齐全，轻松购物</p></li>
			<li><p class="mod_service_txt">多仓直发，极速配送</p></li>
			<li><p class="mod_service_txt">正品行货，精致服务</p></li>
			<li><p class="mod_service_txt">天天低价，畅选无忧</p></li>
		</ul>
	</div>

	<div style="text-align: center;margin-top: 5px;">
		<ul class="list-inline btn btn-default">
			<li><a href="info.jsp">关于我们</a></li><li>|</li>
			<li><a>联系我们</a></li><li>|</li>
			<li><a>招贤纳士</a></li><li>|</li>
			<li><a>法律声明</a></li><li>|</li>
			<li><a>友情链接</a></li><li>|</li>
			<li><a>支付方式</a></li><li>|</li>
			<li><a>配送方式</a></li><li>|</li>
			<li><a>服务声明</a></li><li>|</li>
			<li><a>广告声明</a></li>
		</ul>
	</div>
	<div style="text-align: center;margin-top: 5px;margin-bottom:20px;background:#f4f4f4;">
		<pre>Copyright &copy; 20015-2019 百脑商城 版权所有</pre>
		<a href="#top"><input class="btn btn-default" value="返回顶部" style="width:20%;"></a>
		<!-- 用js实现置顶，置底功能 -->
		<div id="backUp"
			style="z-index: 9999; position: fixed ! important; right: 5px; bottom: 70px;height:50px;with:50px; ">
			<img style="height:50px;with:50px;" src="./img/top.jpg" />
		</div>
		<div id="backDown"
			style="z-index: 9999; position: fixed ! important; right: 5px; bottom: 30px;height:50px;with:50px;">
			<img style="transform: rotate(180deg);height:50px;with:50px;"
				src="./img/top.jpg" />
		</div>
	</div>

</div>
<script>
//回顶部
$('#backUp').click(function () { $('html,body').animate({ scrollTop: '0px' }, 500); return false; });
//回底部（网页最末端）
$('#backDown').click(function () { $('html,body').animate({ scrollTop: document.getElementsByTagName('BODY')[0].scrollHeight}, 500); return false; });
</script>