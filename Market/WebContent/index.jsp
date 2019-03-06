<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마켓플레이스</title>
</head>
<body>
<%

	if(session.isNew() || session.getAttribute("userid") == null) {
		response.sendRedirect("login.html");
	}
	else {
		response.sendRedirect("main.jsp");
	}

%>
</body>
</html>


