<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");  %>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market",
			"root","617122");
	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM board");
	
	out.println("<center><br>");
	out.println("<h2>게시판</h2>");
	out.println("<hr><br><br>");
	out.println("<table border=1>");
	out.println("<tr><td colspan=6 width=800 align=right>");
	out.println("<a href='boardAdd.html'>게시물등록</a></td></tr>");
	
	out.println("<tr><td>작성자</td><td>사진</td><td>내용</td><td>날짜</td><td>삭제</td>");
	
	
	while(rs.next()) {
		out.println("<tr>");
		String s = rs.getString("uid");
		out.println("<td>" + s + "</td>");
		out.println("<td><img src='imageView2.jsp?uid=" + rs.getString("uid") + "' width=100></td>");
		out.println("<td>" + rs.getString("content") + "</td>");
		out.println("<td>" + rs.getString("date") + "</td>");	
		out.println("<td><a href ='boardDelete.jsp?id="+rs.getString("uid")+"'>[Delete]</a></td>");
		out.println("</tr>");
	}
	out.println("</table>");
	out.println("</center>");
	
	st.close();
	rs.close();
	conn.close();
%>