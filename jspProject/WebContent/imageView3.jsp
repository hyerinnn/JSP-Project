<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

	String title = request.getParameter("title");
	String sql ="SELECT * FROM recom WHERE title='"+title+"'"; 

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
		         "root","617122");

	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);

	byte[] imageData = null;
	if(rs.next()){
		Blob img = rs.getBlob("image"); 
		imageData = img.getBytes(1, (int)img.length());
	}

	st.close();
	rs.close();
	conn.close();
	
	out.clear();
	pageContext.pushBody();
	
	response.setContentType("image/gif");
	OutputStream os = response.getOutputStream();
	os.write(imageData);
	os.flush();
	os.close();

%>