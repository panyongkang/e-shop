<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>�˻�����¼</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"dingdanshengcheng");
 String dingdanbianhao="";  	String xiadanren="";  	
 dingdanbianhao=(String)mlbdq.get("dingdanbianhao");  	xiadanren=(String)mlbdq.get("xiadanren");  	 
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="tuihuanhuojilu_add.jsp?id=<%=id%>";
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



new CommDAO().insert(request,response,"tuihuanhuojilu",ext,true,false,""); 

}

%>

  <body >
 <form  action="tuihuanhuojilu_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ����˻�����¼:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">������ţ�</td><td><input name='dingdanbianhao' type='text' id='dingdanbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.dingdanbianhao.value='<%=dingdanbianhao%>';document.form1.dingdanbianhao.setAttribute("readOnly",'true');</script>		<tr><td  width="200">�µ��ˣ�</td><td><input name='xiadanren' type='text' id='xiadanren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly"  readonly='readonly' /></td></tr><script language="javascript">document.form1.xiadanren.value='<%=xiadanren%>';document.form1.xiadanren.setAttribute("readOnly",'true');</script>		<tr><td>ģʽ��</td><td><select name='moshi' id='moshi'><option value="�˻�">�˻�</option><option value="����">����</option></select>&nbsp;*<label id='clabelmoshi' /></td></tr>		<tr><td  width="200">����ʱ�䣺</td><td><input name='shenqingshijian' type='text' id='shenqingshijian' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" style='width:120px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelshenqingshijian' /></td></tr>		<tr><td  width="200">����ԭ��</td><td><textarea name='shenqingyuanyin' cols='50' rows='5' id='shenqingyuanyin' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
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
 
	var moshiobj = document.getElementById("moshi"); if(moshiobj.value==""){document.getElementById("clabelmoshi").innerHTML="&nbsp;&nbsp;<font color=red>������ģʽ</font>";return false;}else{document.getElementById("clabelmoshi").innerHTML="  "; } 	var shenqingshijianobj = document.getElementById("shenqingshijian"); if(shenqingshijianobj.value==""){document.getElementById("clabelshenqingshijian").innerHTML="&nbsp;&nbsp;<font color=red>����������ʱ��</font>";return false;}else{document.getElementById("clabelshenqingshijian").innerHTML="  "; } 	


return true;   
}   
popheight=450;
</script>  


