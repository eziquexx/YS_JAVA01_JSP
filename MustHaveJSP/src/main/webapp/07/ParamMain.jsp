<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pValue = "아기공룡";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamMain</title>
</head>
<body>
<jsp:useBean id="person" class="common.Person" scope="request" />
<jsp:setProperty name="person" property="name" value="김삿갓" />
<jsp:setProperty name="person" property="age" value="50" />


<jsp:forward page="ParamForward.jsp?param1=둘리">
	<jsp:param name="param2" value="도봉구 쌍문동" />
	<jsp:param name="param3" value="<%=pValue %>"/>
</jsp:forward>






</body>
</html>