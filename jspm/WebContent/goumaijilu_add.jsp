<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>购买记录</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
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
<script language="javascript">

function gow()
{
	document.location.href="goumaijilu_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){

double jinej=0;jinej=Float.valueOf(request.getParameter("chushoujiage")).floatValue()*Float.valueOf(request.getParameter("goumaishuliang")).floatValue();

ext.put("issh","否");

ext.put("jine",jinej);

new CommDAO().insert(request,response,"goumaijilu",ext,true,false,""); 

}

%>

  <body >
 <form  action="goumaijilu_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加购买记录:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">图书编号：</td><td><input name='tushubianhao' type='text' id='tushubianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tushubianhao.value='<%=tushubianhao%>';document.form1.tushubianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">图书名称：</td><td><input name='tushumingcheng' type='text' id='tushumingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tushumingcheng.value='<%=tushumingcheng%>';document.form1.tushumingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">图书类别：</td><td><input name='tushuleibie' type='text' id='tushuleibie' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.tushuleibie.value='<%=tushuleibie%>';document.form1.tushuleibie.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">出售价格：</td><td><input name='chushoujiage' type='text' id='chushoujiage' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.chushoujiage.value='<%=chushoujiage%>';document.form1.chushoujiage.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">销量：</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.xiaoliang.value='<%=xiaoliang%>';document.form1.xiaoliang.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">购买数量：</td><td><input name='goumaishuliang' type='text' id='goumaishuliang' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelgoumaishuliang' />必需数字型</td></tr>
		<tr><td  width="200">金额：</td><td> 此项不必填写，系统自动计算</td></tr>
		<tr><td  width="200">购买时间：</td><td><input name='goumaishijian' type='text' id='goumaishijian' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelgoumaishijian' /></td></tr>
		<tr><td  width="200">购买人：</td><td><input name='goumairen' type='text' id='goumairen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>




<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var goumaishuliangobj = document.getElementById("goumaishuliang"); if(goumaishuliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(goumaishuliangobj.value)){document.getElementById("clabelgoumaishuliang").innerHTML=""; }else{document.getElementById("clabelgoumaishuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var goumaishijianobj = document.getElementById("goumaishijian"); if(goumaishijianobj.value==""){document.getElementById("clabelgoumaishijian").innerHTML="&nbsp;&nbsp;<font color=red>请输入购买时间</font>";return false;}else{document.getElementById("clabelgoumaishijian").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  


