<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>


<META content="MSHTML 6.00.2800.1106" name=GENERATOR>


</HEAD>
	<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("�û������������");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("��֤�����");
 <%}%>
 
 popheight = 39;
 </script>
 <div class="topnav">

            <div class="topnavCont">

                <div class="topMenu">

                    <a href="index.jsp">���羫Ʒ�����������߽���ϵͳ</a>
  
					 

              </div>
		      <div class="topMenu">
		        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="61%"><%

	
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
	 %>
                     
					  <form action="jspm?ac=login&amp;a=a" method="post" name="f11" id="f11" style="display: inline">
                        <table height="32" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td  height="32" align="left" >�û���
                              <input name="username" type="text" id="username" style="width:80px; height:20px; border:solid 1px #000000; color:#666666">
                              ����
                              <input name="pwd1" type="password" id="pwd1" style="width:80px; height:20px; border:solid 1px #000000; color:#666666">
							  <select name="cx" id="cx" style="width:80px; height:20px;">
          
			<option value="ע���û�">ע���û�</option>
			
          </select>
                              ��֤��
                              <input type="text" name="pagerandom" id="pagerandom" style="width:45px; height:20px; border:solid 1px #000000; color:#666666"></td>
                            <td align="left" valign="top" style=" padding-left:3px; padding-right:3px;"><a href="javascript:loadimage();"><img alt="����������ң�" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"></a></td>
                            <td align="left"><input type="submit" name="Submit3" value="��¼" style=" border:solid 1px #000000; color:#666666; width:60px; height:20px;" onClick="return checklog();" />
                                <input type="button" name="Submit3" value="�һ�����" onClick="javascript:location.href='zmm.jsp';" style=" border:solid 1px #000000; color:#666666;width:60px; height:20px; display:none" /></td>
                          </tr>
                        </table>
                      </form>
                      <script type="text/javascript">
          
           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
function checklog()
{
	if(document.f11.username.value=="" || document.f11.pwd1.value=="" || document.f11.pagerandom.value=="")
	{
		alert("����������");
		return false;
	}
}
           
                          </script>
                      <%
					}
					else
					{
					%>
					
                      <table width="514" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="30" align="left" valign="middle">�û���:<%=request.getSession().getAttribute("username")%>������Ȩ��: <%=request.getSession().getAttribute("cx")%>
                              <input type="button" name="Submit" value="�˳�" onClick="location.href='logout.jsp';"  style=" border:solid 1px #000000; color:#666666; width:60px; height:20px;">
                              <input type="button" name="Submit2" value="���˺�̨" onClick="location.href='main.jsp';"  style=" border:solid 1px #000000; color:#666666; width:60px; height:20px;"></td>
                        </tr>
                      </table>
                    <%
					}
					%></td>
                    <td width="39%">
					  <form name="formsc" id="formsc" method="post" action="shangpinxinxilist4.jsp">
					  </form>
					</td>
                  </tr>
                </table>
		      </div>
					
               



            </div>



        </div> 



