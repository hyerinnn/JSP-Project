<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%
	out.println("picture:" + request.getParameter("picture") + "<br>");
	out.println("name:" + request.getParameter("name") + "<br>");
	out.println("id:" + request.getParameter("id") + "<br>");
	out.println("pw:" + request.getParameter("pw") + "<br>");
	out.println("<hr>");
	
	InputStreamReader isr = new InputStreamReader(request.getInputStream(), "UTF-8");
	BufferedReader br = new BufferedReader(isr);
	String line;
	while((line = br.readLine()) != null) {
		out.println(line + " ");
	}
%>

