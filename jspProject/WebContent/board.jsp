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
	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM board");
	
	out.println("<center><br>");
	out.println("<h2 >후기게시판</h2>");
	out.println("<hr><br><br>");
	out.println("<table class='tbl'  >");
	
	out.println("<tr><td colspan=5 width=100 align=right>");
	out.println("<a href ='boardAdd.html'><input type='button' name='버튼' value='새 게시물 등록'></a></td></tr>");
	out.println("<tr class=color><th align ='middle'>ID</th><th align ='middle' width=200>제목</th><th align ='middle' width=80>장소</th><th align ='middle' width=80>테마</th><th align ='middle' width=100>날짜</th></tr>");
	
	
	
	while(rs.next()) {
		out.println("<tr>");
		String s = rs.getString("uid");
		out.println("<td align ='middle'>" + s + "</td>");
		out.println("<td align ='middle'><a href='board2.jsp?title=" + rs.getString("title")+"''  text-decoration: none;>" + rs.getString("title")+ "</a></td>");
		out.println("<td align ='middle'>" + rs.getString("place") + "</td>");
		out.println("<td align ='middle'>" + rs.getString("tema") + "</td>");
		out.println("<td align ='middle'>" + rs.getString("date") + "</td>");	
		out.println("</tr>");
	}
	
	
	
	out.println("</table>");
	out.println("</center>");
	
	st.close();
	rs.close();
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