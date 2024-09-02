<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
String id = request.getParameter("id");
String sex = request.getParameter("sex");
String[] favo = request.getParameterValues("favo");
String strFavo = "";
if(favo != null){
	for(int i = 0; i< favo.length; i++) {
		strFavo += favo[i] + "  ";
	}
}

String intro = request.getParameter("intro").replace("\r\n","<br/>");

%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관련사항 : <%= favo %></li>
	<li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>