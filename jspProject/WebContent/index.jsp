<% request.setCharacterEncoding("UTF-8");  %>
<%

	if(session.isNew() || session.getAttribute("userid") == null) {
		response.sendRedirect("login.html");
	}
	else {
		response.sendRedirect("main.jsp");
	}

%>



