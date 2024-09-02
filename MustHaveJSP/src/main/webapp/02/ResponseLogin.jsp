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
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234") ) {
	// 로그인성공
	// out.println("로그인 성공");
	// 성공하면 ResponsWelcome.jsp 로 보내기.
	response.sendRedirect("ResponseWelcome.jsp");
} else {
	// out.println("로그인 실패");
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
}

%>
</body>
</html>