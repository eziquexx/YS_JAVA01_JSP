<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
BBBBBBBBBBBBBBBBBBB<br/>
<%
String strId = request.getParameter("id");
out.println("아이디 : " + strId + "<br/>");
%>
<%
String strPwd = request.getParameter("pwd");
out.println("비밀번호 : " + strPwd + "<br/>");
%>
<%
String week = request.getParameter("week");
out.println("요일 : " + week + "<br/>");
%>
<%
String hobby = request.getParameter("hobby");
out.println("취미 : " + hobby + "<br/>");
%>
<%
String city = request.getParameter("citys");
out.println("지역 : " + city + "<br/>");
%>
</body>
</html>