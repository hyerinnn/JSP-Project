<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market",
			"root","617122");
	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM user");
	
	out.println("<center><br>");
	out.println("<h2>사용자리스트</h2>");
	out.println("<hr><br><br>");
	out.println("<table border=1>");
	out.println("<tr><td colspan=6 width=100 align=right>");
	out.println("<a href='signup.html'>사용자등록</a></td></tr>");
	

	out.println("<tr>");
	out.println("<td>Image</td><td>Name</td><td align ='middle'>ID</td><td>Password</td><td>Date</td><td>Action</td></tr>");
	
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td><img src='imageView.jsp?id=" + rs.getString("id") + "' width=100></td>");//이미지패스가 아닌 jsp로설정. id로 넣어주고. 크기는 100으로 지정.
		String s = rs.getString("name");
		out.println("<td>" + s + "</td>");
		out.println("<td>" + rs.getString("id") + "</td>");
		out.println("<td>" + rs.getString("password") + "</td>");
		out.println("<td>" + rs.getString("date") + "</td>");
		out.println("<td><a href = 'userInfo.jsp?id="+rs.getString("id")+"'>[Update]</a>");
		out.println("<a href ='unregister.jsp?id="+rs.getString("id")+"'>[Delete]</a></td>");
		out.println("</tr>");
	}
	
	out.println("</table>");
	out.println("</center>");
	
	
	st.close();
	rs.close();
	conn.close();
%>