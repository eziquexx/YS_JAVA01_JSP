<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼 Session</title>
</head>
<body>
<!-- 메뉴 -->
<jsp:include page="../common/Link.jsp" />
<h2>로그인 페이지</h2>
<%-- 아이디 : <%= session.getAttribute("UserId") %><br/>
이름 : <%= session.getAttribute("UserName") %><br/> --%>
<%
if(request.getAttribute("LoginErrMsg") != null) {
	out.println(request.getAttribute("LoginErrMsg") + "<br/>");
};
%>
<%
if(session.getAttribute("UserId") == null) {
	// 로그인 입력하는 화면
%>
<script type="text/javascript">
function validateForm(form) {
	if(!form.user_id.value) {
		alert("아이디를 입력하세요");
		return false;
	}
	if(!form.user_pw.value) {
		alert("비밀번호를 입력하세요");
		return false;
	}
}
</script>

<form action="LoginProcess.jsp" method="post"
 name="loginFrm" onsubmit="return validateForm(this);">
	아이디 : <input type="text" name="user_id" /><br />
	패스워드 : <input type="text" name="user_pw" /><br />
	<input type="submit" value="로그인" />
</form>


<%	
} else {
	// ooo님 로그인하셨습니다. 문구
	// [로그아웃]
%>
<%= session.getAttribute("UserName") %>님 로그인 하셨습니다. <br/>
<a href="Logout.jsp">[로그아웃]</a>

<%
}
%>

</body>
</html>