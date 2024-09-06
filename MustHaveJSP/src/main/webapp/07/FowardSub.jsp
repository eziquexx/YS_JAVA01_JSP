<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>포워드 결과</h2>
<p>Page영역: <%= pageContext.getAttribute("pageAttr") %></p>
<p>Request영역: <%= request.getAttribute("requestAttr") %></p>
</body>
</html>