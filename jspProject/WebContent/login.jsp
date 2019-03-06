<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");  %>
<% 

String uid = request.getParameter("id");

if (session.isNew() || session.getAttribute("userid")==null){ 
	session.setAttribute("userid", uid); 
}
 session.setMaxInactiveInterval(30); 

String sql = "SELECT * FROM user WHERE id = '"+uid+"'";

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(sql);

boolean flag = false;
if(rs.next()){
	String pass = request.getParameter("ps");
	if(pass.equals(rs.getString("password"))) {
		response.sendRedirect("main.jsp");
	}
	else {
		out.println("<script> alert('패스워드가 일치하지 않습니다..');history.back();</script>");
	}

}
else {
	out.println("<script> alert('사용자가 존재하지 않습니다.'); history.back(); </script>");
}
st.close();
rs.close();
conn.close();

if (flag) {
	response.sendRedirect("main.jsp");
}
%>