<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인폼</h2>
<%
String loginErr = request.getParameter("loginErr");
if(loginErr != null) {
	out.println("로그인 실패");
}
%>
<form action="./ResponseLogin.jsp">
아이디 : <input type="text" name="user_id" placeholder="아이디입력">
비밀번호 : <input type="text" name="user_pwd" placeholder="비밀번호입력">
<input type="submit" value="로그인">
</form>
</body>
</html>