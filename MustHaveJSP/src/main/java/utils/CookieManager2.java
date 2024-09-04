package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager2 {

	// 쿠키생성(이름, 값, 유지시간)
	// HttpServletResponse 를 생성하기 위해 response를 생성,
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		Cookie cookie = new Cookie(cName, cValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	
	// 쿠키읽기(이름)
	// 클라이언트가 cookie를 보내오면 cookie 안에 cName을 찾아 String 타입으로 반환
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		// 클라이언트가 보낸 cookie를 배열 형태의 cookies 변수에 담기.
		Cookie[] cookies = request.getCookies(); 
		if (cookies != null) { // 만약에 cookies에 값이 있다면
			for(Cookie c : cookies) { // c변수에 cookies 배열에 있는 값을 하나씩 담아 돌리겠다는 뜻
				String cookieName = c.getName(); // c변수에 있는 이름을 얻어서 cookieName에 저장
				if (cookieName.equals(cName)) { // 만약에 cookieName과 cName이 같으면 실행문 실행
					cookieValue = c.getValue(); // c변수에서 value값을 얻어서 cookieValue에 저장 
				} 
			}
		}
		return cookieValue; // 마지막에는 cookieValue를 반환.
	}
	
	//쿠키삭제(이름)
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}
