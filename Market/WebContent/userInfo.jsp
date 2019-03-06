<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market",
			"root","617122");
	
	Statement st = conn.createStatement();
	
	String sql = "SELECT * FROM user WHERE id='" + request.getParameter("id") + "'";
	ResultSet rs = st.executeQuery(sql);
	
	String userId = "",userPass="",userName="";
	if(rs.next()){
			userId= rs.getString("id");
			userPass= rs.getString("password");
			userName= rs.getString("name");
	}
		
	
	st.close();
	rs.close();
	conn.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 플레이스</title>
</head>
<body>

<center> 
<h2>회원가입</h2>
<hr>

<form method="post" action="userUpdate.jsp"> 
	
	 <table>
		   <tr>
			      <td align="right">아이디(이메일)</td>       
			      <td><input type="hidden"  name="id" value = <%= userId %>><%= userId %></td>   
		   </tr>
		   <tr>
			      <td align="right"> 이름 </td>
			      <td><input type="text"  name="name" value = <%= userName %>></td> 
		   </tr>
		    <tr>
			      <td align="right">패스워드</td>       
			      <td><input type="password"  name="pw" value = <%= userPass %> ></td>   
		   </tr>
		   		    <tr>
			      <td align="right">패스워드(확인)</td>       
			      <td><input type="password"  name="pw2"></td>   
		   </tr>
		   <tr><td colspan=2><br></td></tr>
		   <tr>
			      <td colspan=2  align="center">
			      		<input type="submit"  value="확인">
			            <input type="reset"  value="취소">
			      </td> 
		   </tr>
	 </table>
</form>
</center>

</body>
</html>
