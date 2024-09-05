<%@page import="java.sql.PreparedStatement"%>
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
<%
JDBConnect jdbc = new JDBConnect();

//회원추가
String id = request.getParameter("user_id");
String pass = request.getParameter("user_pwd");
String name = request.getParameter("user_name");

//;
String sql = "INSERT INTO member (id,pass,name,regidate) VALUES (?,?,?, sysdate)";
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
psmt.setString(1,id);
psmt.setString(2,pass);
psmt.setString(3,name);

int inResult = psmt.executeUpdate();
out.println(inResult+"행이 입력되었습니다.");

jdbc.close();
%>
</body>
</html>