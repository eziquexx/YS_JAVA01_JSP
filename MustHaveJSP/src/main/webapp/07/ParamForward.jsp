<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamForward</title>
</head>
<body>
<h2>자바빈즈 받기</h2>
<jsp:useBean id="person" class="common.Person" scope="request" />
<p>이름: <jsp:getProperty name="person" property="name" /></p>
<p>나이: <jsp:getProperty name="person" property="age" /></p>

<h2>파라미터 받기</h2>
<p>이름: <%= request.getParameter("param1") %></p>
<p>주소: <%= request.getParameter("param2") %></p>
<p>특징: <%= request.getParameter("param3") %></p>

<jsp:include page="inc/ParamInclude.jsp">
	<jsp:param name="loc1" value="노인과 바다" />
	<jsp:param name="loc2" value="헤밍웨이"/>
</jsp:include>
</body>
</html>