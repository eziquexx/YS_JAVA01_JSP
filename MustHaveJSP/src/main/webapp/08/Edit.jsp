<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
	String num = request.getParameter("num");
	out.print(num);
	
	// DAO생성 DB연결
	BoardDAO dao = new BoardDAO(application);
	
	// 게시물 가져오기
	BoardDTO dto = dao.selectView(num);
	
	// DB연결 끊기
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/Link.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp" onsubmit="return validateForm(this);">
<input type="text" name="num" value="<%= num%>" />
	<table border="1" width="90%">
		<tr>
			<td width="!0%">번호</td>
			<td width="40%"><%= dto.getNum() %></td>
			<td width="!0%">작성자</td>
			<td width="40%"><%= dto.getName() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%= dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%= dto.getVisitcount() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">
				<input type="text" name="title" style="width:90%;" value="<%= dto.getTitle() %>" />
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">
				<textarea name="content" style="width: 90%; height: 100px; text-align: left;"><%= dto.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="submit" onclick="">저장하기</button>
				<button type="reset">입력하기</button>
				<button type="button" onclick="location.href='List.jsp';">목록보기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>