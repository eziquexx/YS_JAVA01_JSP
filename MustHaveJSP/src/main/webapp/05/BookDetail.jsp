<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.OracleConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>도서 상세보기</h2>
<%
String loginErr = request.getParameter("loginErr");
if (loginErr != null) {
	out.println("도서삭제실패");
}
%>

<%
	String num_param = request.getParameter("num");

	OracleConn jdbc = new OracleConn();
	String sql = "SELECT num, title, content, writer, pub_year FROM book";
	// WHERE문 주의할 점. 앞에 띄어쓰기해서 공백을 줘야한다. 자세한 설명은 못 들었음.
	// 우선 해줘야 한다는 점만 기억하자.
	sql += " WHERE num=" + num_param; 
	
	// SQL쿼리를 실행하기 위한 statement 객체를 생성
	Statement stmt = jdbc.con.createStatement();
	
	// 쿼리 요청하여 가져오기
	// SQL SELECT 쿼리를 실행하여 그 결과를 ResultSet 객체로 반환받는 코드.
	// stmt는 위에 생성한 statement 객체
	// executeQuery(sql) 메서드는 SQL SELECT 쿼리를 시행하고, 쿼리 결과를 ResultSet 객체로 반환
	// (sql)은 실행할 SQL 쿼리 문자열. SELECT * FROM users 와 같은 쿼리
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs != null){
		rs.next();
		int num = rs.getInt("num");
		String title = rs.getString("title");
		String content = rs.getString("content");
		String writer = rs.getString("writer");
		int pub_year = rs.getInt("pub_year");	
	
%>	

제목 : <%= title %><br/>
내용 : <%= content %><br/>
저자 : <%= writer %><br/>
출판년도 : <%= pub_year %><br/>

<form action="./BookProcess.jsp" method="post">
	<input type="text" name="work_mode" value="DEL"/>
	<input type="text" name="book_num" value="<%= num %>"/>
	<input type="submit" value="삭제"/>
</form>

<%
}
%>


</body>
</html>