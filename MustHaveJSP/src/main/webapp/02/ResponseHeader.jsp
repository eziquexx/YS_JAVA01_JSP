<%@page import="java.util.Collection"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = s.parse(request.getParameter("add_date")).getTime();

java.sql.Date date2 = new java.sql.Date(add_date);
System.out.println(date2);

int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");

// 응답헤더에 값을 추가
response.addDateHeader("myBirthday", add_date);
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004);
response.addHeader("myName", add_str);
response.setHeader("myName", "안중근"); // 덮어써서 안중근이라고 화면에 출력됨
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>응답헤더 정보출력</h2>
<%
	Collection<String> headerNames = response.getHeaderNames();
	for(String hName: headerNames) {
		String hValue = response.getHeader(hName);
		out.println("<p>" + hName + " : " + hValue + "</p>");
	}
%>

<h2>myNumber 출력</h2>
<%
	Collection<String> myNumber = response.getHeaders("myNumber");
	for(String myNum: myNumber) {
%>
		<li>myNumber : <%= myNum %> </li>
<%
	}
%>

</body>
</html>