package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	// 아이디와 비번으로 DB(member)테이블에서 회원정보 얻어오기
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO(); // 생성
		// DB에서 아이디 패스워드로 회원정보 얻기
		String query = "SELECT id, pass, name, regidate FROM member ";
			   query += "WHERE id = ? AND pass = ?";
		
			   try {
				   psmt = con.prepareStatement(query);
				   psmt.setString(1, uid);
				   psmt.setString(2, upass);
				   
				   rs = psmt.executeQuery();
				   
				   if (rs.next()) {
					   // 해당회원이 있으면
					   // 회원정보값을 dto에 넣기
					   dto.setId(rs.getString("id"));
					   dto.setPass(rs.getString("pass"));
					   dto.setName(rs.getString("name"));
					   dto.setRegidate(rs.getString("regidate"));
				   } else {
					   // 해당회원이 없으면
				   }
				   
			   } catch(Exception e) {
				   e.printStackTrace();
			   } finally {
				   
			   }

			   return dto; // dto 반환
	}
}
