<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>���� �÷��̽�</title>
</head>
<body>
<%
String uid = request.getParameter("id");
if (session.isNew() || session.getAttribute("userid")==null){  //���缼�Ǿȿ� �������̵��� �Ӽ��� ���� ���ٸ� �� �α��� ����ڰ����ٸ� 
	session.setAttribute("userid", uid); // �������̵��� ��Ʈ����Ʈ �̸����� ���� �α��ε� ����� ���̵� uid�� �������
}
 session.setMaxInactiveInterval(3); //���� �����ð� 
%>
<h5 align="right"> <%= session.getAttribute("userid") %></h5>   
<center>
<h2>�����÷��̽�</h2>
<a href="#">��ǰ����Ʈ</a>
<a href="#">�Խ���</a>
<a href="#">����</a>
<hr>
</center>
</body>
</html>  						 