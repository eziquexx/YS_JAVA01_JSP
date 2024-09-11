<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
//값을 얻기
String title = request.getParameter("title");
String content = request.getParameter("content");

//dto객체생성 값 넣기
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString() );

//dao객체를 이용해서 저장하기
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertBoard(dto);
dao.close();
out.print("게시글 추가 결과:"+ iResult);
//성공 실패
if(iResult == 1){
	//성공하면 목록으로 이동
	response.sendRedirect("List.jsp");
	
} else {
	//실패 메시지후 글쓰기로 이동
	JSFunction.alertBack("글쓰기 실패", out);
}
%>