<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>��̨��ർ��</title>
<link rel="stylesheet" type="text/css" href="images/public.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><head></head>

<body id="bg">
	<!-- ��߽ڵ� -->
	<div class="container">

		<div class="leftsidebar_box"><a href="sy.jsp" target="main"><div class="line"><img src="images/coin01.png" />&nbsp;&nbsp;��ҳ</div></a>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="images/coin03.png" /><img class="icon2" src="images/coin04.png" /> ע���û�����<img class="icon3" src="images/coin19.png" /><img class="icon4" src="images/coin20.png" />
				</dt>
				
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="zhuceyonghu_list.jsp" target="main">ע���û���ѯ</a><img class="icon5" src="images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="images/coin01.png" /><img class="icon2" src="images/coin02.png" /> ͼ��������<img class="icon3" src="images/coin19.png" /><img class="icon4" src="images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="tushuleibie_add.jsp" target="main">ͼ��������</a><img class="icon5" src="images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="tushuleibie_list.jsp" target="main">ͼ������ѯ</a><img class="icon5" src="images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="images/coin07.png" /><img class="icon2" src="images/coin08.png" /> ͼ����Ϣ����<img class="icon3" src="images/coin19.png" /><img class="icon4" src="images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="tushuxinxi_add.jsp" target="main">ͼ����Ϣ���</a><img class="icon5" src="images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="tushuxinxi_list.jsp" target="main">ͼ����Ϣ��ѯ</a><img class="icon5" src="images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="images/coin10.png" /><img class="icon2" src="images/coin09.png" /> ���ﳵ����<img class="icon3" src="images/coin19.png" /><img class="icon4" src="images/coin20.png" />
				</dt>
				
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="goumaijilu_list.jsp" target="main">���ﳵ����</a><img class="icon5" src="images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="images/coin11.png" /><img class="icon2" src="images/coin12.png" /> ������Ϣ����<img class="icon3" src="images/coin19.png" /><img class="icon4" src="images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="dingdanshengcheng_list.jsp" target="main">������Ϣ����</a><img class="icon5" src="images/coin21.png" />
				</dd>
				
			</dl>
		
			
			
	
			
			
			<dl class="system_log">
				<dt>
					<img class="icon1" src="images/coin15.png" /><img class="icon2" src="images/coin16.png" /> ���ͼ����<img class="icon3" src="images/coin19.png" /><img class="icon4" src="images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="xinwentongzhi_add.jsp?lb=���ͼ" target="main">���ͼ���</a><img class="icon5" src="images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="xinwentongzhi_list.jsp?lb=���ͼ" target="main">���ͼ����</a><img class="icon5" src="images/coin21.png" />
				</dd>
				
			</dl>
			
			
			
			
			
			<dl class="system_log">
				<dt>
					<img class="icon1" src="images/coinL1.png" /><img class="icon2" src="images/coinL2.png" /> ϵͳ����<img class="icon3" src="images/coin19.png" /><img class="icon4" src="images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a href="yhzhgl.jsp" target="main" class="cks">����Ա�û�</a><img class="icon5" src="images/coin21.png" />
				</dd>
				
				<dd>
					<img class="coin11" src="images/coin111.png" /><img class="coin22" src="images/coin222.png" /><a class="cks" href="logout.jsp" target="_blank">�˳�</a><img class="icon5" src="images/coin21.png" />
				</dd>
			</dl>

		</div>

	</div>
</body>
</html>
<!--
ͼ����Ϣ����
shangpinxinxi_add ͼ����Ϣ���
shangpinxinxi_list ͼ����Ϣ��ѯ

�����¼����
goumaijilu_add �����¼���
goumaijilu_list �����¼��ѯ

�������ɹ���
dingdanshengcheng_add �����������
dingdanshengcheng_list �������ɲ�ѯ

ͼ��������
shangpinleibie_add ͼ��������
shangpinleibie_list ͼ������ѯ

jixacxichxuxliaxnxjixe
-->





