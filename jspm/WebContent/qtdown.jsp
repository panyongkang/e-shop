
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

	<div class="footer">

  <style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
	<table width="100%" height="123" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
          
          <tr>
            <td width="1002" height="88" ><table width="83%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="26" align="center" ><span class="STYLE1">版权所有：网络精品电子书屋在线交易系统 技术支持：xxxxxxxxxxxxx 开发日期： <%
	  java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.CHINA);

String result = format.format(date);
out.print(result);
	  %></span></td>
              </tr>
              <tr>
                <td height="24" align="center" ><span class="STYLE1">最佳效果: 1024*768 或1440*900 或 1360*768 </span></td>
              </tr>
              <tr>
                <td height="24" align="center" ><span class="STYLE1">备案号：xxxxx</span></td>
              </tr>
            </table></td>
          </tr>
</table>
</div>