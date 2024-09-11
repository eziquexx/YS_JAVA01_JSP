<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//수정할 값 얻기
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//DTO에 1차 보관
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DTO DB 저장
BoardDAO dao = new BoardDAO(application);
int iresult = dao.updateEdit(dto);
dao.close();

if (iresult == 1) {
	response.sendRedirect("View.jsp?num="+dto.getNum());
} else {
	JSFunction.alertBack("수정하기 실패", out);
}
%>