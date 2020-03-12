<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>图书信息</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="tushuxinxi_add.jsp?id=<%=id%>";
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



ext.put("issh","否");



new CommDAO().insert(request,response,"tushuxinxi",ext,true,false,""); 

}

%>

  <body >
 <form  action="tushuxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加图书信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">图书编号：</td><td><input name='tushubianhao' type='text' id='tushubianhao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeltushubianhao' /></td></tr>
		<tr><td  width="200">图书名称：</td><td><input name='tushumingcheng' type='text' id='tushumingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeltushumingcheng' /></td></tr>
		<tr><td>图书类别：</td><td><%=Info.getselect("tushuleibie","tushuleibie","leibie")%>&nbsp;*<label id='clabeltushuleibie' /></td></tr>
		<tr><td  width="200">出售价格：</td><td><input name='chushoujiage' type='text' id='chushoujiage' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelchushoujiage' /></td></tr>
		<tr><td  width="200">详细介绍：</td><td><textarea name='xiangxijieshao' cols='50' rows='5' id='xiangxijieshao' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		<tr><td  width="200">图片：</td><td><input name='tupian' type='text' id='tupian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">销量：</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='0' onblur='' style='border:solid 1px #000000; color:#666666'  readonly="readonly"  /></td></tr>
		
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
 
	var tushubianhaoobj = document.getElementById("tushubianhao"); if(tushubianhaoobj.value==""){document.getElementById("clabeltushubianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入图书编号</font>";return false;}else{document.getElementById("clabeltushubianhao").innerHTML="  "; } 
	var tushubianhaoobj = document.getElementById("tushubianhao");  
if(tushubianhaoobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=tushuxinxi&col=tushubianhao&value="+tushubianhaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabeltushubianhao").innerHTML="&nbsp;&nbsp;<font color=red>图书编号已存在</font>";  
return false;
}else{document.getElementById("clabeltushubianhao").innerHTML="  ";  
}  
} 
	var tushumingchengobj = document.getElementById("tushumingcheng"); if(tushumingchengobj.value==""){document.getElementById("clabeltushumingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入图书名称</font>";return false;}else{document.getElementById("clabeltushumingcheng").innerHTML="  "; } 
	var tushuleibieobj = document.getElementById("tushuleibie"); if(tushuleibieobj.value==""){document.getElementById("clabeltushuleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入图书类别</font>";return false;}else{document.getElementById("clabeltushuleibie").innerHTML="  "; } 
	var chushoujiageobj = document.getElementById("chushoujiage"); if(chushoujiageobj.value==""){document.getElementById("clabelchushoujiage").innerHTML="&nbsp;&nbsp;<font color=red>请输入出售价格</font>";return false;}else{document.getElementById("clabelchushoujiage").innerHTML="  "; } 
	var chushoujiageobj = document.getElementById("chushoujiage"); if(chushoujiageobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(chushoujiageobj.value)){document.getElementById("clabelchushoujiage").innerHTML=""; }else{document.getElementById("clabelchushoujiage").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  


