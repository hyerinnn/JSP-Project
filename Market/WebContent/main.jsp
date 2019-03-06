<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>마켓 플레이스</title>
</head>
<body>
<%
String uid = request.getParameter("id");
if (session.isNew() || session.getAttribute("userid")==null){  //현재세션안에 유저아이디의 속성의 값이 없다면 즉 로그인 사용자가없다면 
	session.setAttribute("userid", uid); // 유저아이디라는 어트리뷰트 이름으로 현재 로그인된 사람의 아이디를 uid에 집어넣음
}
 session.setMaxInactiveInterval(3); //세션 유지시간 
%>
<h5 align="right"> <%= session.getAttribute("userid") %></h5>   
<center>
<h2>마켓플레이스</h2>
<a href="#">상품리스트</a>
<a href="#">게시판</a>
<a href="#">방명록</a>
<hr>
</center>
</body>
</html>  						 