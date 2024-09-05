<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.OracleConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
</head>
<body>
<h2>도서 목록</h2>
<%
	OracleConn jdbc = new OracleConn();
	String sql = "SELECT num, title, content, writer, pub_year FROM book";
	
	// SQL쿼리를 실행하기 위한 statement 객체를 생성
	Statement stmt = jdbc.con.createStatement();
	
	// 쿼리 요청하여 가져오기
	// SQL SELECT 쿼리를 실행하여 그 결과를 ResultSet 객체로 반환받는 코드.
	// stmt는 위에 생성한 statement 객체
	// executeQuery(sql) 메서드는 SQL SELECT 쿼리를 시행하고, 쿼리 결과를 ResultSet 객체로 반환
	// (sql)은 실행할 SQL 쿼리 문자열. SELECT * FROM users 와 같은 쿼리
	ResultSet rs = stmt.executeQuery(sql);
%>

<table border="1">
<thead>

	<tr>
		<th>제목</th>
		<th>내용</th>
		<th>저자</th>
		<th>출판년도</th>
	</tr>

</thead>
<tbody>
<!-- 반복되는 부분이라서 출력을 할 거다. while 문으로. -->
<% 
// rs.next() 메서드를 호출하여 다음 행으로 이동하고, 
// rs.getString("column_name") 또는 rs.getInt("column_name") 등을 사용하여 
// 컬럼 값을 추출합니다.
while(rs.next()) { // rs 변수의 next 실행.
	int num			= rs.getInt("num");
	String title 	= rs.getString("title");
	String content	= rs.getString("content");
	String writer	= rs.getString("writer");
	int pub_year	= rs.getInt("pub_year");
%>
	<tr>
		<td><a href="./BookDetail.jsp?num=<%= num %>"><%= title %></a></td>
		<td><%= content %></td>
		<td><%= writer %></td>
		<td><%= pub_year %></td>		
	</tr>
	<%
}
%>
</tbody>
</table>

<%
	jdbc.close();
%>
<br/>
<a href="./BookInput.jsp">추가</a>

</body>
</html>