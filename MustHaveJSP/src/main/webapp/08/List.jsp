<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// dao 목록 가져오기

// 게시판 dao생성해서 db접속
BoardDAO dao = new BoardDAO(application);

// 검색조건 map에 보관
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

Map<String, Object> param = new HashMap<>();
if(searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

// 검색조건에 따른 게시판 목록 수 읽기
int totalCount = dao.selectCount(param);
out.print("검색결과:" + totalCount);

%>
<%
//현재 Navi Index
int NavIndex = 1;
String tempIndex = request.getParameter("NavIndex");
if(tempIndex != null && !tempIndex.equals("")) {
	NavIndex = Integer.parseInt(tempIndex);
}
//List_Size
int listSize = Integer.parseInt(application.getInitParameter("LIST_SIZE"));
//Navi_Size
int naviSize = Integer.parseInt(application.getInitParameter("NAVI_SIZE"));

int maxNavIndex = (int)Math.ceil((double)totalCount/listSize);

int startNavIndex = ((NavIndex/naviSize)*naviSize)+1;
int endNavIndex = Math.min(startNavIndex+naviSize-1, maxNavIndex);

int prevNavIndex =  Math.max(startNavIndex -1, 1);
int nextNavIndex = Math.min(endNavIndex+1, maxNavIndex) ;
int minNavIndex = 1;

int startNum = ((NavIndex-1)*listSize)+1;
int endNum = Math.min( startNum + listSize, totalCount);

param.put("start", startNum-1);	
param.put("listsize", listSize);

//검색조건에 따른 게시판 목록 데이터 읽기
List<BoardDTO> boardLists = dao.selectListPage(param);

//db접속해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<!-- 메뉴 -->
<jsp:include page="../common/Link.jsp" />
<h2>목록보기(List)</h2>

<!-- 검색 -->
<form method="get">
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title"> 제목 </option>
					<option value="content"> 내용 </option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="submit" value="검색하기" />
			</td>
		</tr>
	</table>
</form>

<!-- 목록 -->
<table border="1" width="90%">
	<thead>
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
	</thead>
	<tbody>
		<%
		if(boardLists.isEmpty()) {		
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
		<%
		} else {
			int vitualNum = totalCount+1;
			for(BoardDTO dto: boardLists){
				vitualNum--;
		%>
		<tr>
			<td><%= vitualNum %></td>
			<td><a href="View.jsp?num=<%=dto.getNum() %>"><%= dto.getTitle() %></a></td>
			<td><%= dto.getName() %></td>
			<td><%= dto.getVisitcount() %></td>
			<td><%= dto.getPostdate() %></td>
		</tr>
		<%
			}
		}
		%>

	</tbody>
</table>

<table border="1" width="90%">
	<tr align="right">
		<td align="center">
		<a href="List.jsp?NavIndex=<%= minNavIndex %>">[처음]</a>&nbsp; 
		<a href="List.jsp?NavIndex=<%= prevNavIndex %>">[이전페이지]</a>&nbsp;
		<%
		for(int i = startNavIndex; i < endNavIndex; i++) {
			if (i == NavIndex ) { // 현재 페이지 번호랑 같으면 링크 표시 x
				out.print(i+"&nbsp;");				
			} else {
				out.print("<a href='List.jsp?NavIndex="+i+"'>"+i+"</a>&nbsp;");	
			} 
		}
		%>
		<a href="List.jsp?NavIndex=<%= nextNavIndex %>">[다음페이지]</a>&nbsp; 
		<a href="List.jsp?NavIndex=<%= maxNavIndex %>">[마지막페이지]</a>
		</td>
		<td>
			<button type="button" onclick="location.href='Write.jsp'">글쓰기</button>
		</td>
	</tr>
</table>

</body>
</html>