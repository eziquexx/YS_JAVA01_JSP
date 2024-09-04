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


String sql = "SELECT id,pass,name,regidate FROM member";
Statement stmt = jdbc.con.createStatement();

ResultSet rs = stmt.executeQuery(sql);

out.println(String.format("%s %s  %s  %s <br/>", "아이디", "비번", "이름", "등록일"));
while(rs.next()) {
	String id = rs.getString(1);
	String pw = rs.getString(2);
	String name = rs.getString("name");
	java.sql.Date regidate  = rs.getDate("regidate");
	
	out.println(String.format("%s %s  %s  %s <br/>", id, pw, name, regidate));
}


jdbc.close();
%>
</body>
</html>