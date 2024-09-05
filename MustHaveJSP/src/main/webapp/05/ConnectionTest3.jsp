<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JDBC 테스트 3</h2>
	<%
JDBConnect jdbc = new JDBConnect(application);

String sql = "SELECT id,pass,name,regidate FROM member";
Statement stmt = jdbc.con.createStatement();

ResultSet rs = stmt.executeQuery(sql);
%>
<table border="1">
	<thead>
	<tr>
	<th>아이디</th>
	<th>비번</th>
	<th>이름</th>
	<th>등록일</th>
	</tr>
</thead>
<tbody>
<% 
while(rs.next()) {
	String uid = rs.getString(1);
	String pw = rs.getString(2);
	String name = rs.getString("name");
	java.sql.Date regidate  = rs.getDate("regidate");
%>	
	<tr>
	<td><%= uid %></td>
	<td><%= pw %></td>
	<td><%= name %></td>
	<td><%= regidate %></td>
	</tr>
<%
}
%>		
	</tbody>	
</table>

<%
jdbc.close();
%>


<!-- 게시판 목록 -->
<h2>게시판 목록</h2>

<%
JDBConnect jdbc2 = new JDBConnect(application);

String sql2 = "SELECT num, title,content,m.name,postdate,visitcount FROM board b join member m on b.id = m.id";
Statement stmt2 = jdbc2.con.createStatement();

ResultSet rs2 = stmt2.executeQuery(sql2);
%>
<table border="1">
<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>글쓴이</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
</thead>
<tbody>
<% 
while(rs2.next()) {
	int num = rs2.getInt("num");
	String title = rs2.getString("title");
	String content = rs2.getString("content");
	String name = rs2.getString("name");
	int visitcount = rs2.getInt("visitcount");
	java.sql.Date postdate = rs2.getDate("postdate");
	
%>	
	<tr>
		<td><%= num %></td>
		<td><%= title %></td>
		<td><%= content %></td>
		<td><%= name %></td>
		<td><%= postdate %></td> <!-- 수정된 부분 -->
		<td><%= visitcount %></td>
	</tr>
<%} %>
</tbody>
</table>




</body>
</html>