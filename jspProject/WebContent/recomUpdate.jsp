<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<% request.setCharacterEncoding("UTF-8");  %>
<% 

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");

PreparedStatement pstmt = conn.prepareStatement("update recom SET place=?, tema=?, season=?, title=?, content=?, image=? WHERE title = ?");
pstmt.setString(1, request.getParameter("id"));
pstmt.setString(2, request.getParameter("place"));
pstmt.setString(3, request.getParameter("tema"));
pstmt.setString(4, request.getParameter("season"));
pstmt.setString(5, request.getParameter("title"));
pstmt.setString(6, request.getParameter("content"));
pstmt.setString(7, request.getParameter("image"));




int count = pstmt.executeUpdate();
if ( count > 0) { 
	out.println("<script> alert('수정되었습니다');" + 
			"window.location = 'subrecom2.jsp'; </script>");
		}
else {
		out.println("<script>alert ('요청하신 작업이 처리되지 않습니다.'); history.back();</script>");
	}
pstmt.close();
conn.close();

%>





