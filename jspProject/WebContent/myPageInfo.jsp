<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");  %>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspProject",
        "root","617122");
	Statement st = conn.createStatement();

	String sql = "SELECT * FROM user WHERE id='" + session.getAttribute("userid") + "'";
	
	ResultSet rs = st.executeQuery(sql);
	
	String userId = "",userPass="",userName="",userPlace="",userTema="",userBirth="",userPhone="";
	if(rs.next()){
			userId= rs.getString("id");
			userPass= rs.getString("password");
			userName= rs.getString("name");
			userPlace= rs.getString("place");
			userTema= rs.getString("tema");
			userBirth= rs.getString("birth");
			userPhone= rs.getString("phone");
	}
		
	
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
<center> 
<h2>개인정보 수정</h2>
<hr>

<form method="post" action="myPageUpdate.jsp"> 
	
	 <table>
		   <tr>
			      <td align="right">아이디</td>       
			      <td><input type="hidden"  name="id" value = <%= userId %>><%= userId %></td>   
		   </tr>
		   <tr>
			      <td align="right"> 이름 </td>
			      <td><input type="text"  name="name" value = <%= userName %>></td> 
		   </tr>
		    <tr>
			      <td align="right">패스워드</td>       
			      <td><input type="password"  name="ps" value = <%= userPass %> ></td>   
		   </tr>
		   <tr>
				<td align ="right">생년월일</td>
				<td><input type="text" name="birth" value = <%= userBirth %> > </td>
		   </tr>
			<tr>
				<td align ="right">연락처</td>
				<td><input type="text" name="phone" value = <%= userPhone %> > </td>
	       </tr>
	<tr>
		<td align ="right">지역</td>
		<td>
		<select name="place"> 
			<option value="">지역선택</option>  
			<option > 서울  </option>
			<option > 경기  </option>
			<option > 부산  </option>
			<option > 울산  </option>
			<option > 인천  </option>
			<option > 대전  </option>
			<option > 대구  </option>
			<option > 제주  </option>
			<option > 전라도  </option>
			<option > 경상도  </option>
			<option > 강원도  </option>
			<option > 기타  </option>
		 </select>
		</td>
	</tr>	
	<tr>
		<td align ="right">여행테마</td>
		<td>
			<input type=radio name=tema value="관광">관광</input>
			<input type=radio name=tema value="체험">체험</input>
			<input type=radio name=tema value="휴식">휴식</input>
		</td>
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
<div id="footer-area">
   <div id="footer">
      <span>혜린이재윤이</span>
       <span id="cpyrt">Copyright2016(c)</span>
   </div>
</div>

</body>
</html>
