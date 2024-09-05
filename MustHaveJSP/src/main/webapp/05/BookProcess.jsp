<%@page import="common.OracleConn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String work_mode = request.getParameter("work_mode");
System.out.print("work_mode : " + work_mode);

if("DEL".equals(work_mode)) {
	OracleConn jdbc = new OracleConn();
	try {
		String book_num = request.getParameter("book_num");
		String sql = "DELETE FROM book WHERE num = ?";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);	
		// title, content, writer, pub_year
		
		psmt.setString(1, book_num);
		
		int inResult = psmt.executeUpdate();
		out.println(inResult + "행이 입력되었습니다.");
		
		if(inResult > 0) { 
			response.sendRedirect("BookList.jsp");
		} else {
			request.getRequestDispatcher("BookDetail.jsp?loginErr=1").forward(request,response);
		}
	
		
	} catch(Exception e) {
		System.out.println(e.getMessage());	
		request.getRequestDispatcher("BookDetail.jsp?loginErr=2").forward(request,response);
	} finally {
		jdbc.close();
	}
} else if("ADD".equals(work_mode)) {
	OracleConn jdbc = new OracleConn();
	try {
		// 추가하기
		String book_title = request.getParameter("book_title");
		String book_content = request.getParameter("book_content");
		String book_writer = request.getParameter("book_writer");
		int book_pub_year = Integer.parseInt(request.getParameter("book_pub_year") );
		
		
		String sql = "INSERT INTO book ( num, title, content, writer, pub_year) VALUES ( seq_book.nextval, ?, ?, ?, ?)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);	
		// title, content, writer, pub_year
		
		psmt.setString(1, book_title);
		psmt.setString(2, book_content);
		psmt.setString(3, book_writer);
		psmt.setInt(4, book_pub_year);
		
		
		// 쿼리 실행. 추가되었는지도 확인.
		int inResult = psmt.executeUpdate();
		out.println(inResult + "행이 입력되었습니다.");
		
		if(inResult > 0) { 
			response.sendRedirect("BookList.jsp");
		} else {
			request.getRequestDispatcher("BookInput.jsp?loginErr=1").forward(request, response);
		}
	} catch(Exception e) {
		System.out.println(e.getMessage());
		request.getRequestDispatcher("BookInput.jsp?loginErr=2").forward(request, response);
		
	} finally {
		jdbc.close();
	}
	
	
	
	
	
}


/* 
name="work_mode"
name="book_title" 
name="book_content"
name="book_writer" 
name="book_pub_year" 
 */
%>