<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String loginId = CookieManager.readCookie(request, "loginId");
String cookieCheck = "";
if(loginId.equals("") == false) {
	cookieCheck = "checked";
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<h2>로그인 페이지</h2>
<form action="IdSaveProcess.jsp" method="post">
아이디: <input type="text" name="user_id" value="<%= loginId %>" placeholder="아이디 입력" />
<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> />아이디저장
<br />
비밀번호: <input type="text" name="user_pwd" placeholder="비밀번호 입력"/>
<br />
<input type="submit" value="로그인" />

</form>
</body>
</html>