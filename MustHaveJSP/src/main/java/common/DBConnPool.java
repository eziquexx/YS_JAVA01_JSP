package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
	// 기본 생성자
	public DBConnPool() {
		try {
			// 커넥션 풀(DataSource) 얻기
			Context initCtx = new InitialContext(); //1
			Context ctx = (Context)initCtx.lookup("java:comp/env"); //2
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle"); //3
			
			// 커넥션 풀을 통해 연결 얻기
			con = source.getConnection(); //4
			
			System.out.println("DB 커넥션 풀 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	
	
	// 연결 해제(자원 반납)
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close(); // 자동으로 커넥션 풀로 반납됨 5
			
			System.out.println("DB 커넥션 풀 자원 반납");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
