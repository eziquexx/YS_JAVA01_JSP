<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가 폼</title>
</head>
<body>
<h2>회원 추가를 위한 폼</h2>
<form action="ExeUpdateTest.jsp" method="post">
아이디: <input type="text" name="user_id" placeholder="아이디 입력" /><br/>
비밀번호: <input type="text" name="user_pwd" placeholder="비밀번호 입력" /><br/>
이름: <input type="text" name="user_name" placeholder="이름 입력" /><br/>
<input type="submit" value="회원등록">
</form>
</body>
</html>