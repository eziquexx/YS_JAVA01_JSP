<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request로 아이디 비밀번호 추출
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

// DAO객체로 회원정보 얻기

// DB접속 정보 얻어오기
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL    = application.getInitParameter("OracleURL");
String oracleId     = application.getInitParameter("OracleId");
String oraclePwd    = application.getInitParameter("OraclePwd");

// 회원테이블 DAO를 이용해서 회원정보DTO를 가져오기(얻기)
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close(); // 꼭 닫아주기.

// 회원의 아이디 값으로 로그인 성공or실패 처리하기
if(memberDTO.getId() != null) {
	// 로그인 성공
	// 세션에 아이디와 이름을 보관할 거임.
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	// 로그인폼 페이지로 이동할 거임.
	response.sendRedirect("LoginForm.jsp");
} else {
	// 로그인 실패
	// request에 에러메시지를 등록하고
	// 로그인폼 페이지로 포워드시킬거임.
	request.setAttribute("LoginErrMsg", "사용자정보가 일치하지 않습니다.");
	RequestDispatcher dispatcher = request.getRequestDispatcher("LoginForm.jsp");
	dispatcher.forward(request, response);
}
%>
아이디
<%= userId %><br/>
비밀번호
<%= userPwd %><br/>