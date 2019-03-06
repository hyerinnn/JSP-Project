<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");  %>

<% 

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");

PreparedStatement pstmt = conn.prepareStatement("DELETE FROM board WHERE title=?");

pstmt.setString(1, request.getParameter("title"));
int count = pstmt.executeUpdate();


if ( count > 0) { 
	response.sendRedirect("boardManage.jsp");
	}
else {
	out.println("<script>alert ('요청하신 작업이 처리되지 않습니다.'); history.back();</script>");
}
conn.close();

%>