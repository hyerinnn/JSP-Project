<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market",
      "root","617122");


PreparedStatement pstmt = conn.prepareStatement("update user SET name=?, password=? WHERE id = ?");
pstmt.setString(1, request.getParameter("name"));
pstmt.setString(2, request.getParameter("ps"));
pstmt.setString(3, request.getParameter("id"));


int count = pstmt.executeUpdate();
if (count > 0) {
   response.sendRedirect("userlist.jsp");   
}
else {
   out.println("<script> alert('요청사진 작업이 처리되지 않습니다.'); history.back(); </script>");
}



%>


