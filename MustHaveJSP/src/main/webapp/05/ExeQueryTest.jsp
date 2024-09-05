<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 회원 조회하는 프로그래밍</title>
</head>
<body>
<%
// JDBConnect 객체 생성
JDBConnect jdbc = new JDBConnect();


// String 타입의 sql변수에 쿼리문 저장. sql 배울때 배운 문법?
// 데이터베이스 연결 객체(jdbc.con)를 사용하여 SQL 쿼리를 실행할 수 있는 Statement 객체를 생성합니다. 
// 이 객체는 SQL 쿼리문을 데이터베이스에 전달하고 결과를 처리하는 데 사용됩니다. 
// stmt를 통해 executeQuery나 executeUpdate 메서드를 호출하여 SQL 명령을 실행할 수 있습니다.
String sql = "SELECT id,pass,name,regidate FROM member";
Statement stmt = jdbc.con.createStatement();


// SQL 쿼리문(sql)을 실행하여 데이터베이스에서 결과를 조회하고, 
// 조회된 데이터를 담고 있는 ResultSet 객체를 반환합니다. 
// 이 ResultSet 객체를 사용하여 쿼리 결과를 반복하면서 데이터를 읽을 수 있습니다. 
// 주로 SELECT 쿼리와 함께 사용됩니다.
ResultSet rs = stmt.executeQuery(sql);

out.println(String.format("%s %s %s %s <br/>", "아이디", "비번", "이름", "등록일"));

// rs.next()는 ResultSet 객체에서 다음 행으로 이동하고, 그 행이 존재하는지 여부를 반환하는 메서드
while(rs.next()) { //rs 변수에 담긴 값의 next() ??
	// 각 변수에 값 초기화.
	String id = rs.getString(1); // 첫번째 열의 데이터
	String pw = rs.getString(2); // 두번째 열으 ㅣ데이터
	String name = rs.getString("name"); // "name"이라는 컬럼의 데이터
	//
	java.sql.Date regidate = rs.getDate("regidate"); // regidate 컬럼의 날짜 데이터
	
	// 화면에 출력하는 코드.
	// String타입으로 포맷해서 보여주기.
	// id, pw, name, regidate를 보여주기.
	out.println(String.format("%s %s %s %s <br/>", id, pw, name, regidate));
}

jdbc.close();

%>
</body>
</html>