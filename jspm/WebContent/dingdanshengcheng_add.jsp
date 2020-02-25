<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>订单生成</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  
   String jinez="";
  jinez=request.getParameter("jinez");
if(request.getParameter("jinez")!=null){
  if(Float.valueOf(jinez).floatValue()==0)
{
	out.print("<script>alert('对不起,您没有未下单的图书!');location.href='goumaijilu_list2.jsp';</script>");
	return;
}
} 
 
   %>
   
   
   <%
//xuxyaxodenxglxu


  String id="";
 

  String stushubianhaoz="";

  String tushumingchengz="";
  String goumaishuliangz="";
  String shanpianxinxiz="";
  String sql2=  "select * from goumaijilu where goumairen='"+request.getSession().getAttribute("username")+"' and issh='否'";
  ArrayList<HashMap> list = PageManager.getPages("",15,sql2, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	
	shanpianxinxiz=shanpianxinxiz+"图书编号："+(String)map.get("tushubianhao")+",图书名称："+(String)map.get("tushumingcheng")+",购买数量："+(String)map.get("goumaishuliang")+";";
	}



 
  
 
   %>
   
   
<script language="javascript">

function gow()
{
	document.location.href="dingdanshengcheng_add.jsp?id=<%=id%>";
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
ext.put("iszf","否");
String sql="update goumaijilu set issh='是' where goumairen='"+request.getSession().getAttribute("username")+"' and issh='否'";
	new CommDAO().commOper(sql); 

new CommDAO().insert(request,response,"dingdanshengcheng",ext,true,false,""); 

}

%>

  <body >
 <form  action="dingdanshengcheng_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加订单生成:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">订单编号：</td><td><input name='dingdanbianhao' type='text' id='dingdanbianhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr>
		  <td>金额：</td>
		  <td><input name='jine' type='text' id='jine' value='<%= jinez%>' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />
		    &nbsp;*
		    <label id='clabeljine' /></td>
   
	 		<tr><td  width="200">订单内容：</td><td><textarea name='dingdanneirong' cols='50' rows='5' id='dingdanneirong' onblur='' style='border:solid 1px #000000; color:#666666' ><%= shanpianxinxiz%></textarea>&nbsp;*<label id='clabeldingdanneirong' /></td></tr>
			
		<tr><td  width="200">下单人：</td><td><input name='xiadanren' type='text' id='xiadanren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">联系方式：</td><td><input name='lianxifangshi' type='text' id='lianxifangshi' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabellianxifangshi' /></td></tr>
		<tr><td  width="200">地址：</td><td><input name='dizhi' type='text' id='dizhi' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeldizhi' /></td></tr>
		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		<tr><td>状态：</td><td><select name='zhuangtai' id='zhuangtai'><option value="已下单">已下单</option></select></td></tr>
		
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
 
	var dingdanneirongobj = document.getElementById("dingdanneirong"); if(dingdanneirongobj.value==""){document.getElementById("clabeldingdanneirong").innerHTML="&nbsp;&nbsp;<font color=red>请输入订单内容</font>";return false;}else{document.getElementById("clabeldingdanneirong").innerHTML="  "; } 
	var lianxifangshiobj = document.getElementById("lianxifangshi"); if(lianxifangshiobj.value==""){document.getElementById("clabellianxifangshi").innerHTML="&nbsp;&nbsp;<font color=red>请输入联系方式</font>";return false;}else{document.getElementById("clabellianxifangshi").innerHTML="  "; } 
	var lianxifangshiobj = document.getElementById("lianxifangshi"); if(lianxifangshiobj.value!=""){ if(/^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(lianxifangshiobj.value)){document.getElementById("clabellianxifangshi").innerHTML=""; }else{document.getElementById("clabellianxifangshi").innerHTML="&nbsp;&nbsp;<font color=red>必需手机格式</font>"; return false;}}  
    var dizhiobj = document.getElementById("dizhi"); if(dizhiobj.value==""){document.getElementById("clabeldizhi").innerHTML="&nbsp;&nbsp;<font color=red>请输入地址</font>";return false;}else{document.getElementById("clabeldizhi").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  


