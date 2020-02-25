<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>图书信息</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">

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

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"tushuxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"tushuxinxi"); 

%>
  <form  action="tushuxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改图书信息:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>图书编号：</td><td><input name='tushubianhao' type='text' id='tushubianhao' value='<%= mmm.get("tushubianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>图书名称：</td><td><input name='tushumingcheng' type='text' id='tushumingcheng' value='<%= mmm.get("tushumingcheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>图书类别：</td><td><%=Info.getselect("tushuleibie","tushuleibie","leibie")%></td></tr><script language="javascript">document.form1.tushuleibie.value='<%=mmm.get("tushuleibie")%>';</script>
     <tr><td>出售价格：</td><td><input name='chushoujiage' type='text' id='chushoujiage' value='<%= mmm.get("chushoujiage")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>详细介绍：</td><td><textarea name='xiangxijieshao' cols='50' rows='5' id='xiangxijieshao' style='border:solid 1px #000000; color:#666666'><%=mmm.get("xiangxijieshao")%></textarea></td></tr>
     <tr><td>图片：</td><td><input name='tupian' type='text' id='tupian' size='50' value='<%= mmm.get("tupian")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
     <tr><td>销量：</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='<%= mmm.get("xiaoliang")%>' style='border:solid 1px #000000; color:#666666'  readonly="readonly"   /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


