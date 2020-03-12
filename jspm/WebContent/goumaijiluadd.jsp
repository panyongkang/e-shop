<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>购买记录</title>
    <link rel="stylesheet" href="css/common.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /></head>

<body>
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
	return;
}
  String id="";

 
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"tushuxinxi");
 String tushubianhao="";
  	String tushumingcheng="";
  	String tushuleibie="";
  	String chushoujiage="";
  	String xiaoliang="";
  	
 tushubianhao=(String)mlbdq.get("tushubianhao");
  	tushumingcheng=(String)mlbdq.get("tushumingcheng");
  	tushuleibie=(String)mlbdq.get("tushuleibie");
  	chushoujiage=(String)mlbdq.get("chushoujiage");
  	xiaoliang=(String)mlbdq.get("xiaoliang");
  	 
 

   %>

   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
function checkform()
{
	var goumaishuliangobj = document.getElementById("goumaishuliang"); if(goumaishuliangobj.value==""){document.getElementById("clabelgoumaishuliang").innerHTML="&nbsp;&nbsp;<font color=red>请输入购买数量</font>";return false;}else{document.getElementById("clabelgoumaishuliang").innerHTML="  "; } 
	var goumaishuliangobj = document.getElementById("goumaishuliang"); if(goumaishuliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(goumaishuliangobj.value)){document.getElementById("clabelgoumaishuliang").innerHTML=""; }else{document.getElementById("clabelgoumaishuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var lianxifangshiobj = document.getElementById("lianxifangshi"); if(lianxifangshiobj.value==""){document.getElementById("clabellianxifangshi").innerHTML="&nbsp;&nbsp;<font color=red>请输入联系方式</font>";return false;}else{document.getElementById("clabellianxifangshi").innerHTML="  "; } 
	var lianxifangshiobj = document.getElementById("lianxifangshi"); if(lianxifangshiobj.value!=""){ if(/^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(lianxifangshiobj.value)){document.getElementById("clabellianxifangshi").innerHTML=""; }else{document.getElementById("clabellianxifangshi").innerHTML="&nbsp;&nbsp;<font color=red>必需手机格式</font>"; return false;}}  
    if(parseInt(document.form1.kucun.value)<parseInt(document.form1.goumaishuliang.value)){alert("对不起，库存必需大于购买数量");return false;}
	
}
function gow()
{
	document.location.href="goumaijiluadd.jsp?id=<%=id%>";
}
</script>


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

                <dt>购买记录</dt>

                <dd class="current"></dd>

            </dl>

        </div>

    </div>

</div>



<div class="content">

    <div class="about">

        <div class="about_txt">
		
		
		
		

						
  <% 		
		
		
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){






String sql="update tushuxinxi set xiaoliang=xiaoliang+"+request.getParameter("goumaishuliang")+" where tushubianhao='"+request.getParameter("tushubianhao")+"'";
	new CommDAO().commOper(sql);




double jinej=0;jinej=Float.valueOf(request.getParameter("chushoujiage")).floatValue()*Float.valueOf(request.getParameter("goumaishuliang")).floatValue();

ext.put("issh","否");

ext.put("jine",jinej);





new CommDAO().insert(request,response,"goumaijilu",ext,true,false,""); 

 }
%>
   <form  action="goumaijiluadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr><td  width="200">图书编号：</td><td><input name='tushubianhao' type='text' id='tushubianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tushubianhao.value='<%=tushubianhao%>';document.form1.tushubianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">图书名称：</td><td><input name='tushumingcheng' type='text' id='tushumingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tushumingcheng.value='<%=tushumingcheng%>';document.form1.tushumingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">图书类别：</td><td><input name='tushuleibie' type='text' id='tushuleibie' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tushuleibie.value='<%=tushuleibie%>';document.form1.tushuleibie.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">出售价格：</td><td><input name='chushoujiage' type='text' id='chushoujiage' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.chushoujiage.value='<%=chushoujiage%>';document.form1.chushoujiage.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">销量：</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.xiaoliang.value='<%=xiaoliang%>';document.form1.xiaoliang.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">购买数量：</td><td><input name='goumaishuliang' type='text' id='goumaishuliang' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelgoumaishuliang' />必需数字型</td></tr>
		<tr><td  width="200">金额：</td><td> 此项不必填写，系统自动计算</td></tr>
		<tr><td  width="200">购买时间：</td><td><input name='goumaishijian' type='text' id='goumaishijian' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelgoumaishijian' /></td></tr>
		<tr><td  width="200">购买人：</td><td><input name='goumairen' type='text' id='goumairen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%=request.getSession().getAttribute("xm")%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		
   
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
	</table>
  </form>
                         




        </div>

    </div>

</div>



<%@ include file="qtdown.jsp"%>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

<script type="text/javascript" src="js/banner.js"></script>

<script type="text/javascript" src="js/common.js"></script>

</body>

</html>










