package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
		// TODO Auto-generated constructor stub
	}

	// 검색 조건에 맞는 데이터 수
	public int selectCount(Map<String,Object> map) {
		int totalCount = 0;
		
		String query = "SELECT count(num) FROM board ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + 
					 " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		try {
			
			stmt = con.createStatement();
			rs   = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1); // 첫번째 열만 가져오기
			
		} catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		
		
		return totalCount;
	}
	
	// 검색 조건에 맞는 데이터 목록
	public List<BoardDTO> selectList(Map<String,Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "SELECT num,title,content,b.id, m.name ,postdate,visitcount "
					 + "FROM board b "
					 + "JOIN member m on b.id = m.id ";
		
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " +
		             " LIKE '%" + map.get("searchWord")+"%' ";    
		}			
		query += " ORDER BY num DESC ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));			
				bbs.add(dto);		
			}		
		} catch(Exception e) {
			System.out.println("게시판 목록을 읽어오다가 에러발생");
			e.printStackTrace();			
		}		
		return bbs;
	
	}
	
	//검색조건에 맞는 데이터목록
	public List<BoardDTO> selectListPage(Map<String,Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "SELECT num,title,content,b.id, m.name ,postdate,visitcount "
					 + "FROM board b "
					 + "JOIN member m on b.id = m.id ";
		
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " +
		             " LIKE '%" + map.get("searchWord")+"%' ";    
		}			
		query += " ORDER BY num DESC ";
		query += " offset " + map.get("start") 
		      + " rows fetch next "+ map.get("listsize")
		      + " rows only ";

		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));			
				bbs.add(dto);		
			}		
		} catch(Exception e) {
			System.out.println("게시판 목록을 읽어오다가 에러발생");
			e.printStackTrace();			
		}		
		return bbs;
	
	}
	
	
	// 게시글 쓰기
	public int insertBoard(BoardDTO dto) {
		int result = 0;
		String query="INSERT INTO board ( num,title,content,id,visitcount) VALUES (SEQ_BOARD_NUM.NEXTVAL,?,?,?,0)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시물 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	// 게시글 조회수 올리기
	public void updateVisitCount(String num) {
		// 쿼리문 작성
		String query = "UPDATE board SET " 
					 + "visitcount = visitcount + 1 " 
					 + "WHERE num = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch(Exception e) {
			System.out.println("게시물 조회수 올리기 실패");
			e.printStackTrace();
		}
		
	}
	
	// 게시물 읽어오기
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		// 쿼리문
		String query = "SELECT num, title, content, b.id, m.name, postdate, visitcount "
					 + "FROM board b "
					 + "JOIN member m on b.id=m.id "
					 + "WHERE num=? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
			}
		} catch(Exception e) {
			System.out.println("상세보기용 데이터 얻기 실패");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	// 게시물 삭제
	public int deletePost(String num) {
		int result = 0;
		String query = "DELETE FROM board WHERE num = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시물 삭제 실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// 게시물 수정하기
	public int updateEdit(BoardDTO dto) {
		int iresult = 0;
		// 쿼리
		String query = "UPDATE board SET "
					 + "title = ?, "
					 + "content = ? "
					 + "WHERE num = ? ";
		try {
			// 
			// 수정값 적용
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			// db저장
			iresult = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시물 수정 실패");
			e.printStackTrace();
		}
		
		return iresult;
	}
	
}
