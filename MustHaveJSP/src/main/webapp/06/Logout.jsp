<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 로그아웃이니까 세션에서 userid와 username지워주면 된다.
session.removeAttribute("UserId");
session.removeAttribute("UserName");
// 로그아웃하면 다시 LoginForm 페이지로 이동
response.sendRedirect("LoginForm.jsp");
%>