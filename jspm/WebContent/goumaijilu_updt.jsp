<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�����¼</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">

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

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"goumaijilu",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"goumaijilu"); 

%>
  <form  action="goumaijilu_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸Ĺ����¼:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>ͼ���ţ�</td><td><input name='tushubianhao' type='text' id='tushubianhao' value='<%= mmm.get("tushubianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>ͼ�����ƣ�</td><td><input name='tushumingcheng' type='text' id='tushumingcheng' value='<%= mmm.get("tushumingcheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>ͼ�����</td><td><input name='tushuleibie' type='text' id='tushuleibie' value='<%= mmm.get("tushuleibie")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���ۼ۸�</td><td><input name='chushoujiage' type='text' id='chushoujiage' value='<%= mmm.get("chushoujiage")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>������</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='<%= mmm.get("xiaoliang")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>����������</td><td><input name='goumaishuliang' type='text' id='goumaishuliang' value='<%= mmm.get("goumaishuliang")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>��</td><td><input name='jine' type='text' id='jine' value='<%= mmm.get("jine")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>����ʱ�䣺</td><td><input name='goumaishijian' type='text' id='goumaishijian' value='<%= mmm.get("goumaishijian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�����ˣ�</td><td><input name='goumairen' type='text' id='goumairen' value='<%= mmm.get("goumairen")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>������</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


