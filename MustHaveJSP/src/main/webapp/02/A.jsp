<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="B.jsp">
<input type="text" name="id" placeholder="아이디 입력해주세요"/>
<input type="password" name="pwd" placeholder="비밀번호 입력해주세요"/> <br />
<!-- 라디오 버튼 -->
요일을 선택해주세요 <br />
<input type="radio" name="week" value="sun"><label>일요일</label>
<input type="radio" name="week" value="mon"><label>월요일</label>
<input type="radio" name="week" value="tue"><label>화요일</label>
<input type="radio" name="week" value="wed"><label>수요일</label>
<input type="radio" name="week" value="thu"><label>목요일</label>
<input type="radio" name="week" value="fri"><label>금요일</label>
<input type="radio" name="week" value="sat"><label>토요일</label>
<br/>

<!-- 체크박스 -->
<input type="checkbox" name="hobby" value="h_movie"><label>영화보기</label>
<input type="checkbox" name="hobby" value="h_music"><label>음악듣기</label>
<input type="checkbox" name="hobby" value="h_book"><label>책읽기</label>
<input type="checkbox" name="hobby" value="h_sleep"><label>잠자기</label>
<br/>

<!-- 선택박스 -->
<label for="citys">Choose a city:</label>
<select id="citys" name="citys">
<option value="seoul">서울</option>
<option value="busan">부산</option>
<option value="daegu">대구</option>
</select>

<br />
<input type="submit" value="전송" />
</form>
</body>
</html>