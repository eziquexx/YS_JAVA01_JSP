<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Input</title>
</head>
<body>
<h2>도서 입력</h2>
<%
String loginErr = request.getParameter("loginErr");
if(loginErr != null) {
	out.println("도서입력실패");
}
%>
<br/>
<form action="BookProcess.jsp" method="post">
작업모드 : <input type="text" name="work_mode" value="ADD" placeholder="작업모드입력"/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목 : <input type="text" name="book_title" placeholder="제목 입력"/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용 : <input type="text" name="book_content" placeholder="내용 입력"/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;저자 : <input type="text" name="book_writer" placeholder="저자 입력"/><br/>
출판년도 : <input type="text" name="book_pub_year" placeholder="출판년도 입력"/><br/>
<input type="submit" value="저장"/>
</form>
<br/>
<a href="./BookList.jsp">목록</a>
</body>
</html>