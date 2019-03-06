<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

	String uid = request.getParameter("id");
	String sql ="SELECT * FROM user WHERE id='"+uid+"'"; 

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market",
			"root","617122");

	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);

	byte[] imageData = null;
	if(rs.next()){
		Blob img = rs.getBlob("image"); //블랍은 자바에 없어서 바이트어레이를 사용해서 자바에서 쓰도록함
		imageData = img.getBytes(1, (int)img.length()); //바이트어레이로 바꾸는 것.
	}

	st.close();
	rs.close();
	conn.close();
	
	out.clear();
	pageContext.pushBody();
	
	response.setContentType("image/gif"); //이미지타입에 맞게 바꾸기
	OutputStream os = response.getOutputStream();
	os.write(imageData);
	os.flush();
	os.close();

%>