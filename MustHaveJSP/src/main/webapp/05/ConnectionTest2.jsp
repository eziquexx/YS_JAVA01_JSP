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
<h2>JDBC 테스트 2</h2>
<%
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd");
	
	JDBConnect jdbc = new JDBConnect(driver, url, id, pwd);

	
	String sql = "SELECT id,pass,name,regidate FROM member";
	Statement stmt = jdbc.con.createStatement();

	ResultSet rs = stmt.executeQuery(sql);

	out.println(String.format("%s %s  %s  %s <br/>", "아이디", "비번", "이름", "등록일"));
	while(rs.next()) {
		String uid = rs.getString(1);
		String pw = rs.getString(2);
		String name = rs.getString("name");
		java.sql.Date regidate  = rs.getDate("regidate");
		
		out.println(String.format("%s %s  %s  %s <br/>", id, pw, name, regidate));
	}

	
	jdbc.close();
%>
</body>
</html>