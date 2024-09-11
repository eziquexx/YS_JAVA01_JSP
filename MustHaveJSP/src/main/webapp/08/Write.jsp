<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 여부를 체크 -->
<%@ include file="./IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판 - 글쓰기</title>
<script type="text/javascript">
function validateForm(form) {
	return true;
}
</script>
</head>
<body>
<!-- 메뉴 -->
<jsp:include page="../common/Link.jsp" />
<h2>글쓰기(Write)</h2>
<form name="writeFrm" method="post" action="WriteProcess.jsp" 
onsubmit="return validateForm(this);">
<table border="1" width="90%">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" style="width: 90%"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="5" style="width: 90%; height: 100px;"></textarea> </td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">저장</button>
			<button type="reset">다시입력</button>
			<button type="button" onclick="location.href='List.jsp'">목록보기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>