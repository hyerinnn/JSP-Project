<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<% 

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");
Statement st = conn.createStatement();

PreparedStatement pstmt = conn.prepareStatement("DELETE FROM recom WHERE title= ?");

pstmt.setString(1, request.getParameter("title"));
int count = pstmt.executeUpdate();


if ( count > 0) { 
	response.sendRedirect("recomManage.jsp");
	}
else {
	out.println("<script>alert ('요청하신 작업이 처리되지 않습니다.'); history.back();</script>");
}
st.close();
pstmt.close();
conn.close();

%>







