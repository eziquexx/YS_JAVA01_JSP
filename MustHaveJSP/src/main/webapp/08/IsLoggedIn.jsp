<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("UserId") == null ) {
	JSFunction.alertLocation("로그인하시고 사용하세요",
			"../06/LoginForm.jsp", out);
}

%>