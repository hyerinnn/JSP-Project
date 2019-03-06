<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<% request.setCharacterEncoding("UTF-8");  %>
<% 

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");

PreparedStatement pstmt = conn.prepareStatement("update user SET password=?, name=?, place=?, tema=?, birth=?, phone=? WHERE id = ?");
pstmt.setString(1, request.getParameter("ps"));
pstmt.setString(2, request.getParameter("name"));
pstmt.setString(3, request.getParameter("place"));
pstmt.setString(4, request.getParameter("tema"));
pstmt.setString(5, request.getParameter("birth"));
pstmt.setString(6, request.getParameter("phone"));
pstmt.setString(7, request.getParameter("id"));



int count = pstmt.executeUpdate();
if ( count > 0) { 
			response.sendRedirect("userlist.jsp");
		}
else {
		out.println("<script>alert ('요청하신 작업이 처리되지 않습니다.'); history.back();</script>");
	}
pstmt.close();
conn.close();
%>





