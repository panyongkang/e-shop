<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��������</title>
	
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

new CommDAO().update(request,response,"dingdanshengcheng",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"dingdanshengcheng"); 

%>
  <form  action="dingdanshengcheng_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸Ķ�������:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>������ţ�</td><td><input name='dingdanbianhao' type='text' id='dingdanbianhao' value='<%= mmm.get("dingdanbianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr>
       <td>��</td>
       <td><input name='jine' type='text' id='jine' value='<%= mmm.get("jine")%>' style='border:solid 1px #000000; color:#666666' /></td>
     </tr>
     
     <tr><td>�������ݣ�</td><td><input name='dingdanneirong' type='text' id='dingdanneirong' value='<%= mmm.get("dingdanneirong")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�µ��ˣ�</td><td><input name='xiadanren' type='text' id='xiadanren' value='<%= mmm.get("xiadanren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>��ϵ��ʽ��</td><td><input name='lianxifangshi' type='text' id='lianxifangshi' value='<%= mmm.get("lianxifangshi")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>��ַ��</td><td><input name='dizhi' type='text' id='dizhi' size='50' value='<%=mmm.get("dizhi")%>' style='border:solid 1px #000000; color:#666666'/></td></tr>
     <tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=mmm.get("beizhu")%></textarea></td></tr>
     <tr style='display:none'><td>״̬��</td><td><select name='zhuangtai' id='zhuangtai'><option value="���µ�">���µ�</option><option value="�ѷ���">�ѷ���</option></select></td></tr><script language="javascript">document.form1.zhuangtai.value='<%=mmm.get("zhuangtai")%>';</script>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


