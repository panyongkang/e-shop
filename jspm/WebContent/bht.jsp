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
		id: 'decoroll2',//����ͼ����id  
		conId: "decoimg_a2",//��ͼ�����id  
		tabId:"deconum2",//СԲ��������ʾid
		tabTn:"a",
		conCn: '.decoimg_b2',//��ͼ������class       
		auto: 1,//�Զ����� 1��0
		effect: 'fade',//Ч������
		eType: 'mouseover',// ����¼�
		pageBt:true,//�Ƿ��а�ť�л�ҳ��
		bns: ['.prev', '.next'],//ǰ��ť����class                          
		interval: 3000// ͣ��ʱ��  
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