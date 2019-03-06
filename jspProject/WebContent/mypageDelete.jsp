<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<% 

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");
Statement st = conn.createStatement();

String sql = "DELETE FROM user WHERE id='" + session.getAttribute("userid")+"'";
int count = st.executeUpdate(sql);



if ( count > 0) { 
	
	session.invalidate();

	out.println("<script> alert('정상적으로 탈퇴되었습니다.');" + 
			"window.location = 'main.jsp'; </script>");
	}
else {
	out.println("<script>alert ('요청하신 작업이 처리되지 않습니다.'); history.back();</script>");
}
st.close();
conn.close();

%>




