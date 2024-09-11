<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
int delResult = dao.deletePost(num);
dao.close();

if (delResult == 1) {
	// 성공하면 목록 페이지로 이동
	JSFunction.alertLocation("삭제성공", "List.jsp", out);
} else {
	// 실패하면
	JSFunction.alertBack("삭제실패", out);
}
%>