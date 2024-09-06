<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>ParamInclude.jsp</h2>
<p>제목: <%= request.getParameter("loc1") %></p>
<p>저자: <%= request.getParameter("loc2") %></p>
</body>
</html>