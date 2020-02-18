<%
	
	//response.sendRedirect(request.getContextPath()+"/computerServlet?method=getComputers");

	request.getRequestDispatcher("/computerServlet?method=getComputers").forward(request, response);
%>