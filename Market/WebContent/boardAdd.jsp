<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<% request.setCharacterEncoding("UTF-8");  %>

<% 
String userId="", userContent="";
byte[] userImage=null;

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
sfu.setSizeMax(16 * 1024 * 1024);
sfu.setHeaderEncoding("UTF-8"); 

List items = sfu.parseRequest(request);
Iterator iter = items.iterator();

while(iter.hasNext()) {
	FileItem item = (FileItem) iter.next();
	if (!item.isFormField()) {
		if(item.getFieldName().equals("image")){
			userImage = item.get();
		}
	}
	else {
		if(item.getFieldName().equals("id")){
			userId = item.getString("UTF-8");
		}

	else if(item.getFieldName().equals("content")){
		userContent = item.getString("UTF-8");
	}
	}
}

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market",
		"root","617122");
Statement st = conn.createStatement();
/*
String sql = "INSERT INTO board VALUES('";
sql += request.getParameter("id") + "', '";
sql += request.getParameter("content") + "', '";
sql += (new SimpleDateFormat("yyyy-MM-dd")).format(new Date()) + "')";

int count = st.executeUpdate(sql);
*/

PreparedStatement pstmt = conn.prepareStatement("INSERT INTO board VALUES(?, ?, ?, ?)");


pstmt.setString(1, userId);
pstmt.setString(2, userContent);
pstmt.setBytes(3, userImage);
pstmt.setString(4, (new SimpleDateFormat("yyyy-MM-dd")).format(new Date()));
int count = pstmt.executeUpdate();


if ( count > 0) { 
	response.sendRedirect("board.jsp");
	}
else {
	out.println("<script>alert ('요청하신 작업이 처리되지 않습니다.'); history.back();</script>");
}
%>
