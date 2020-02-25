<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>图书信息</title>
    <link rel="stylesheet" href="css/common.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /></head>

<body>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>

<div class="header">
    <div class="headerBox">
        <%@ include file="qttop2.jsp"%>
        <div class="headerCont iscrollAnchor">
            <div class="headerC">
                 <%@ include file="qttop.jsp"%>
            </div>
        </div>
    </div>
</div>
<%@ include file="bht.jsp"%>

<div class="subNav iscrollAnchor">

    <div class="subNavbox">

        <div class="subNavcont">

            <dl>

                <dt>图书信息</dt>

                <dd class="current"></dd>

            </dl>

        </div>

    </div>

</div>



<div class="content">

    <div class="about">

        <div class="about_txt">
		
		
		
		

						<form name="form1" id="form1" method="post" action="">
   搜索:  图书编号：<input name="tushubianhao" type="text" id="tushubianhao" style='border:solid 1px #000000; color:#666666' size="12" />  图书名称：<input name="tushumingcheng" type="text" id="tushumingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  图书类别：<%=Info.getselect("tushuleibie","tushuleibie","leibie"," 1=1 ")%>  出售价格：<input name="chushoujiage1" type="text" id="chushoujiage1"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />-<input name="chushoujiage2" type="text" id="chushoujiage2"  value='' style='border:solid 1px #000000; color:#666666;width:30px' />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit5" value="切换视图"  style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='tushuxinxilist.jsp';" />
</form>
						<table width="100%" height="12%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                           <% 
  	


  	 new CommDAO().delete(request,"tushuxinxi"); 
    String url = "tushuxinxilisttp.jsp?issh='是'"; 
    String sql =  "select * from tushuxinxi where 1=1 ";
	
if(request.getParameter("tushubianhao")=="" ||request.getParameter("tushubianhao")==null ){}else{sql=sql+" and tushubianhao like '%"+request.getParameter("tushubianhao")+"%'";}
if(request.getParameter("tushumingcheng")=="" ||request.getParameter("tushumingcheng")==null ){}else{sql=sql+" and tushumingcheng like '%"+request.getParameter("tushumingcheng")+"%'";}
if(request.getParameter("tushuleibie")=="" ||request.getParameter("tushuleibie")==null ){}else{sql=sql+" and tushuleibie like '%"+request.getParameter("tushuleibie")+"%'";}
if (request.getParameter("chushoujiage1")==""  ||request.getParameter("chushoujiage1")==null ) {}else{sql=sql+" and chushoujiage >= '"+request.getParameter("chushoujiage1")+"'";}
if (request.getParameter("chushoujiage2")==""  ||request.getParameter("chushoujiage2")==null ) {}else {sql=sql+" and chushoujiage <= '"+request.getParameter("chushoujiage2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
                            <td align="center"><table width="150" height="153" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="126" align="center"><a href="tushuxinxidetail.jsp?id=<%=map.get("id")%>"><img src="<%=map.get("tupian")%>" width="109" height="126" border="0" /></a></td>
                                </tr>
                                <tr>
                                  <td height="26" align="center"><%=map.get("tushumingcheng")%></td>
                                </tr>
                            </table></td>
                            <%
								if (i==4)
								{
									i=0;
									out.print("</tr><tr>");
								}
				  	}
					
				  %>
                          </tr>
                        </table>
						
${page.info }
                         




        </div>

    </div>

</div>



<%@ include file="qtdown.jsp"%>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

<script type="text/javascript" src="js/banner.js"></script>

<script type="text/javascript" src="js/common.js"></script>

</body>

</html>










