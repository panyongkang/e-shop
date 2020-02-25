<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>退换货记录</title>
	
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

new CommDAO().update(request,response,"tuihuanhuojilu",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"tuihuanhuojilu"); 

%>
  <form  action="tuihuanhuojilu_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改退换货记录:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
          <tr><td>订单编号：</td><td><input name='dingdanbianhao' type='text' id='dingdanbianhao' value='<%= mmm.get("dingdanbianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>下单人：</td><td><input name='xiadanren' type='text' id='xiadanren' value='<%= mmm.get("xiadanren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>模式：</td><td><select name='moshi' id='moshi'><option value="退货">退货</option><option value="换货">换货</option></select></td></tr><script language="javascript">document.form1.moshi.value='<%=mmm.get("moshi")%>';</script>     <tr><td>申请时间：</td><td><input name='shenqingshijian' type='text' id='shenqingshijian' value='<%= mmm.get("shenqingshijian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>申请原因：</td><td><textarea name='shenqingyuanyin' cols='50' rows='5' id='shenqingyuanyin' style='border:solid 1px #000000; color:#666666'><%=mmm.get("shenqingyuanyin")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


