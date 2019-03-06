<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");  %>
    <%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>우리놀러갈래?</title>
   <link rel="stylesheet" type="text/css" href="board.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
</head>
<body>

<div id ="header">
   <div id="info">
      <div id="free">
         <p align="right"> 
            <% if (session.isNew() || session.getAttribute("userid")==null){
                        out.println("로그인을 해주세요");
                     }
               else{  out.println(session.getAttribute("userid")+ "님 환영합니다."); }
                   session.setMaxInactiveInterval(360);    
            %>
         </p>
      </div>
      <div id="con">
 <ul> 
            
               <% if (session.isNew() || session.getAttribute("userid")==null){
                        out.println("<li><a href='login.html'>LOGIN</a></li>");
                        
                        }
                  else{  out.println("<li><a href='logout.jsp'>LOGOUT</a></li>");
                        out.println("<li><a href='myPage.jsp'>MY PAGE</a></li>");
                        out.println("<li><a href='Manage.html'>MANAGE</a></li> ");
                        
                     }%>

               <% if (session.isNew() || session.getAttribute("userid")==null){
                        out.println("<li><a href='signup.html'>JOIN US</a></li>");
                        }
               %>
   			                                         
         </ul>
      </div>
   </div>
   <div id="navigation-logo">
         <div id="logo">
            <a href="main.jsp">
               <img src="image/logo.png" width="250" height="100" >
            </a>
         </div>
   </div>
    <div id="navigation-manu">
         <div id="manu">
            <ul>
               <li><a href="main.jsp"> 홈 </a></li>
               <li><a href="subrecom.jsp"> 여행지 추천받기 </a></li>
               <li><a href="recommend.html"> 추천하기 </a></li>
               <li><a href="board.jsp"> 후기게시판 </a></li>
            </ul>
         </div>
   </div>         
</div>

<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");
	
	// 추천게시판 관리부분
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM recom WHERE uid='" + session.getAttribute("userid") + "'");
	

	out.println("<center><br>");
	out.println("<h3>추천게시판</h3>");
	out.println("<br><br>");
	out.println("<table class='tbl' colspan=7 width=400>");
	out.println("<tr><th>ID</th><th>제목</th><th>사진</th><th>내용</th><th>날짜</th></tr>");
	
	
	while(rs.next()) {
		out.println("<tr>");	
		out.println("<td>" + rs.getString("uid") + "</td>");
		out.println("<td><a href='subrecom2.jsp?title=" + rs.getString("title")+"''>" + rs.getString("title") + "</a></td>");	
		out.println("<td><img src='imageView3.jsp?title=" + rs.getString("title") + "' width=100></td>");
		out.println("<td>" + rs.getString("content") + "</td>");
		out.println("<td>" + rs.getString("date") + "</td>");
		
		out.println("</tr>");
	}
	out.println("</table>");
	out.println("<br><br>");
	out.println("<hr>");
	
	// 후기 게시판 관리부분
	Statement st2 = conn.createStatement();
	ResultSet rs2 = st.executeQuery("SELECT * FROM board WHERE uid='" + session.getAttribute("userid") + "'");
	
	out.println("<br><br>");
	out.println("<h3>후기게시판</h3>");
	out.println("<br><br>");
	out.println("<table class='tbl' colspan=7 width=400>");
	out.println("<tr><th>ID</th><th>제목</th><th>사진</th><th>내용</th><th>날짜</th></tr>");
	
	while(rs2.next()) {
		out.println("<tr>");
		out.println("<td>" + rs2.getString("uid") + "</td>");
		out.println("<td><a href='board2.jsp?title=" + rs2.getString("title")+"''>" + rs2.getString("title") + "</a></td>");	
		out.println("<td><img src='imageView2.jsp?title=" + rs2.getString("title") + "' width=100></td>");
		out.println("<td>" + rs2.getString("content") + "</td>");
		out.println("<td>" + rs2.getString("date") + "</td>");
		
		out.println("</tr>");
	}
	
	out.println("</table>");
	out.println("</center>");
	
	st.close();
	rs.close();
	st2.close();
	rs2.close();
	conn.close();
%>
<div id="footer-area">
   <div id="footer">
      <span>혜린이재윤이</span>
       <span id="cpyrt">Copyright2016(c)</span>
   </div>
</div>

</body>
</html>
