<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>


<link rel="stylesheet" type="text/css" href="css/stylebht.css">

<script type="text/javascript" src="js/koala.min.1.5.js"></script>
<script type="text/javascript">
Qfast.add('widgets', { path: "js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
Qfast(false, 'widgets', function () {
	K.tabs({
		id: 'decoroll2',//焦点图包裹id  
		conId: "decoimg_a2",//大图域包裹id  
		tabId:"deconum2",//小圆点数字提示id
		tabTn:"a",
		conCn: '.decoimg_b2',//大图域配置class       
		auto: 1,//自动播放 1或0
		effect: 'fade',//效果配置
		eType: 'mouseover',// 鼠标事件
		pageBt:true,//是否有按钮切换页码
		bns: ['.prev', '.next'],//前后按钮配置class                          
		interval: 3000// 停顿时间  
	}) 
}) 
</script>
<div id="decoroll2" class="imgfocus">

	<div id="decoimg_a2" class="imgbox">

			
			 <%
										
    for(HashMap map:new CommDAO().select("select  id,biaoti,shouyetupian from xinwentongzhi where 1=1 and shouyetupian<>'' order by id desc",1,5)){
	
     %>
			<div class="decoimg_b2"><a href="gg_detail.jsp?id=<%=map.get("id")%>"><img src="<%=map.get("shouyetupian")%>" title="<%=map.get("biaoti")%>" ></a></div>
			<%
			}
	 %>
		

	</div>
	
	<ul id="deconum2" class="num_a2">
		 
		<li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
		
		<li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
		
		<li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
		
		<li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
		
		<li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
		
	</ul>
	
</div>