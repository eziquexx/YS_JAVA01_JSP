<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가 프로그래밍</title>
</head>
<body>
<%
JDBConnect jdbc = new JDBConnect(); // JDBConnect 객체 생성

// 회원 추가 (들어가야할 정보: id, password, name)
// MemberAddFormTest.jsp에서 input name="" 안에 있는 것을 파라미터로 가져온다.
String id = request.getParameter("user_id"); 
String pass = request.getParameter("user_pwd");
String name = request.getParameter("user_name");

// String타입의 sql 변수에 sql문 넣기.
// ?, ?, ? 는 비워둔거. 값 저장할 거임. 뭘로? setString메서드로 첫번째는 id, 두번째는 password 이런식으로.
String sql = "INSERT INTO member (id,pass,name,regidate) VALUES (?,?,?, sysdate)";
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
psmt.setString(1, id);
psmt.setString(2, pass);
psmt.setString(3, name);

// int타입의 inResult 변수 선언 및 초기화
// psmt.executeUpdate() SQL 쿼리를 실행하여 데이터베이스를 수정하고, 수정된 행의 수를 반환합니다.
// 이 메서드는 주로 INSERT, UPDATE, DELETE 쿼리와 함께 사용된다.
// 반환된 정수 값(inResult)은 쿼리가 성공적으로 실행된 행의 수를 나타낸다.
int inResult = psmt.executeUpdate();
out.println(inResult + "행이 입력되었습니다.");

jdbc.close();

%>



</body>
</html>