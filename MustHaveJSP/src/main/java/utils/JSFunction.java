package utils;

import jakarta.servlet.jsp.JspWriter;

// CookieManager 상속받는 JSFunction class를 만들기
public class JSFunction extends CookieManager {
	
	// 메시지 알람창 -> 페이지 이동
	// alert창 생성자 만들었음.
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "";
			script += "<script>";
			script += "alert('" + msg +"');";
			script += "location.href = '" + url + "';";
			script += "</script>";
			out.println(script);
		} catch (Exception e) {
			
		}
	}
	
	// 메시지 알람창 -> 이전페이지
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "";
			script += "<script>";
			script += "alert('" + msg + "');";
			script += "history.back()";
			script += "</script>";
			out.println(script);
		} catch (Exception e) {
			
		}
	}
}
