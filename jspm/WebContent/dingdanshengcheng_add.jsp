<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>��������</title>
	
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
	out.print("<script>alert('�Բ���,��û��δ�µ���ͼ��!');location.href='goumaijilu_list2.jsp';</script>");
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
  String sql2=  "select * from goumaijilu where goumairen='"+request.getSession().getAttribute("username")+"' and issh='��'";
  ArrayList<HashMap> list = PageManager.getPages("",15,sql2, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	
	shanpianxinxiz=shanpianxinxiz+"ͼ���ţ�"+(String)map.get("tushubianhao")+",ͼ�����ƣ�"+(String)map.get("tushumingcheng")+",����������"+(String)map.get("goumaishuliang")+";";
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
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"��", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"��";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){



ext.put("issh","��");
ext.put("iszf","��");
String sql="update goumaijilu set issh='��' where goumairen='"+request.getSession().getAttribute("username")+"' and issh='��'";
	new CommDAO().commOper(sql); 

new CommDAO().insert(request,response,"dingdanshengcheng",ext,true,false,""); 

}

%>

  <body >
 <form  action="dingdanshengcheng_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ��Ӷ�������:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">������ţ�</td><td><input name='dingdanbianhao' type='text' id='dingdanbianhao' value='<%=Info.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr>
		  <td>��</td>
		  <td><input name='jine' type='text' id='jine' value='<%= jinez%>' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />
		    &nbsp;*
		    <label id='clabeljine' /></td>
   
	 		<tr><td  width="200">�������ݣ�</td><td><textarea name='dingdanneirong' cols='50' rows='5' id='dingdanneirong' onblur='' style='border:solid 1px #000000; color:#666666' ><%= shanpianxinxiz%></textarea>&nbsp;*<label id='clabeldingdanneirong' /></td></tr>
			
		<tr><td  width="200">�µ��ˣ�</td><td><input name='xiadanren' type='text' id='xiadanren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">��ϵ��ʽ��</td><td><input name='lianxifangshi' type='text' id='lianxifangshi' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabellianxifangshi' /></td></tr>
		<tr><td  width="200">��ַ��</td><td><input name='dizhi' type='text' id='dizhi' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeldizhi' /></td></tr>
		<tr><td  width="200">��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		<tr><td>״̬��</td><td><select name='zhuangtai' id='zhuangtai'><option value="���µ�">���µ�</option></select></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
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
 
	var dingdanneirongobj = document.getElementById("dingdanneirong"); if(dingdanneirongobj.value==""){document.getElementById("clabeldingdanneirong").innerHTML="&nbsp;&nbsp;<font color=red>�����붩������</font>";return false;}else{document.getElementById("clabeldingdanneirong").innerHTML="  "; } 
	var lianxifangshiobj = document.getElementById("lianxifangshi"); if(lianxifangshiobj.value==""){document.getElementById("clabellianxifangshi").innerHTML="&nbsp;&nbsp;<font color=red>��������ϵ��ʽ</font>";return false;}else{document.getElementById("clabellianxifangshi").innerHTML="  "; } 
	var lianxifangshiobj = document.getElementById("lianxifangshi"); if(lianxifangshiobj.value!=""){ if(/^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(lianxifangshiobj.value)){document.getElementById("clabellianxifangshi").innerHTML=""; }else{document.getElementById("clabellianxifangshi").innerHTML="&nbsp;&nbsp;<font color=red>�����ֻ���ʽ</font>"; return false;}}  
    var dizhiobj = document.getElementById("dizhi"); if(dizhiobj.value==""){document.getElementById("clabeldizhi").innerHTML="&nbsp;&nbsp;<font color=red>�������ַ</font>";return false;}else{document.getElementById("clabeldizhi").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  


