<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="person" class="common.Person" />
<jsp:setProperty name="person" property="*" />

<p>이름: <jsp:getProperty name="person" property="name" /></p>
<p>나이: <jsp:getProperty name="person" property="age" /></p>
</body>
</html>