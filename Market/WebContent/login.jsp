<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
out.println("아이디: " + request.getParameter("id")+"<br>");
out.println("비밀번호: " + request.getParameter("ps")+"<br>");

String uid = request.getParameter("id");
System.out.println(uid);
String sql ="SELECT * FROM user WHERE id='"+uid+"'"; 
System.out.println(sql);
Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market",
		"root","617122");

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(sql);

boolean flag = false;
if(rs.next()){
	String pass = request.getParameter("ps");
	if (pass.equals(rs.getString("password"))) {
		flag = true;
	}
	else{
		out.println("<script>alert ('사용자가 존재하지 않습니다'); history.back();</script>");
		//"window.location = 'login.html;'</script>" = history.back 
	 // 윈도우 어쩌고하면 내용 다사라짐
	 // 히스토리백하면 내가 쓴 정보남아있음 -> 기존에 뭘 잘못 입력했는지 알수있게 
	  //아래 else에선 히스토리백해야됨,
	}
}
else {
	out.println("<script>alert ('사용자가 존재하지 않습니다'); history.back();</script>");	
}

st.close();
rs.close();
conn.close();

if (flag) {
	response.sendRedirect("main.jsp");
}
%>