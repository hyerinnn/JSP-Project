
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
String userId="", userContent="", userTitle="", userTema="", userSeason="", userPlace="";
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
		else if(item.getFieldName().equals("place")){
			userPlace = item.getString("UTF-8");
		}
		else if(item.getFieldName().equals("tema")){
			userTema = item.getString("UTF-8");
		}
		else if(item.getFieldName().equals("season")){
				userSeason = item.getString("UTF-8");
		}
		else if(item.getFieldName().equals("title")){
			userTitle = item.getString("UTF-8");
		}

		else if(item.getFieldName().equals("content")){
			userContent = item.getString("UTF-8");
		}
	}
}


	Class.forName("com.mysql.jdbc.Driver").newInstance();

	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
		         "root","617122");
	
	Statement st = conn.createStatement();
	
	String sql = "SELECT * FROM recom WHERE title='" + request.getParameter("title") + "'";
	ResultSet rs = st.executeQuery(sql);
	
	st.close();
	rs.close();
	conn.close();
%>
<html>
<head>
<meta charset="UTF-8">
<title>우리놀러갈래?</title>
   <link rel="stylesheet" type="text/css" href="main.css">
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
                   session.setMaxInactiveInterval(60);    
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
<center>

<h2>추천하기</h2>
<hr>
<form method="post" action="recomUpdate.jsp" enctype="multipart/form-data">
<table cellspacing="1" cellpadding="5">
	<tr><td align ="left">*아이디</td></tr>
	<tr><td><input type="text" name="id" size="58" value = <%= userId %>><%= userId %> </td></tr>
	<tr><td align ="left">*지역</td></tr>
		<tr><td><select name="place" >
			<option value="">지역선택</option>  
			<option value="서울"> 서울  </option>
			<option value="경기"> 경기  </option>
			<option value="부산"> 부산  </option>
			<option value="울산"> 울산  </option>
			<option value="인천"> 인천  </option>
			<option value="대전"> 대전  </option>
			<option value="대구"> 대구  </option>
			<option value="제주"> 제주  </option>
			<option value="전라도"> 전라도  </option>
			<option value="경상도"> 경상도  </option>
			<option value="강원도"> 강원도  </option>
			<option value="기타"> 기타  </option>
		 </select>
		</td></tr>
	<tr><td align ="left">*여행테마</td></tr>
	<tr><td><input type=radio name=tema value="관광">관광</input>
			<input type=radio name=tema value = "체험">체험</input>
			<input type=radio name=tema value = "휴식">휴식</input>
	</td></tr>
	<tr><td align ="left">*계절</td></tr>
	<tr><td><input type=checkbox name = "season" value="봄">봄</input>
			<input type=checkbox name = "season" value="여름">여름</input>
			<input type=checkbox name = "season" value="가을">가을</input>
			<input type=checkbox name = "season" value="겨울">겨울</input>
	</td></tr>
	<tr><td align ="left">*제목</td></tr>
	<tr><td><input type="text" name="title" size="58" value = <%= userTitle %>><%= userTitle %></td></tr>
	<tr><td align ="left">*내용</td></tr>
	<tr><td><textarea name="content" cols=60 rows=20 value = <%= userContent %>><%= userContent %></textarea> </td></tr>
	<tr><td align ="left">*사진첨부</td></tr>
	<tr><td><input type="file" name="image" value = <%= userImage %>><%= userImage %></input></td></tr>
	<tr><td colspan=2><br></td></tr>
	<tr><td colspan=2 align="center">
			<input type="submit" value="수정하기">
			<input type="reset" value="취소">
		</td>	
	</tr>
</table>
</form>
</center>

<div id="footer-area">
   <div id="footer">
      <span>혜린이재윤이</span>
       <span id="cpyrt">Copyright2016(c)</span>
   </div>
</div>

</body>
</html>