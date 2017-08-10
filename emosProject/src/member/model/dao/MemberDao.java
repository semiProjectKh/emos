package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.model.vo.Member;

public class MemberDao {

	public Member selectMember(Connection con, String userId, String userPwd) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from member " + "where user_id = ? and user_pwd = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				member = new Member();
				member.setUserNum(rset.getInt("user_num"));
				member.setUserId(userId);
				member.setPhone(rset.getString("user_phone"));
				member.setUserName(rset.getString("user_name"));
				member.setUserPwd(userPwd);
				member.setEmail(rset.getString("email"));
				member.setBirth(rset.getDate("birth"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				member.setGender(rset.getString("gender"));
				member.setVerse(rset.getInt("verse"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return member;
	}

	public int insertMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into member values ((select max(user_num) from member) + 1, ? ,?, ?, ?, ?, ?, default, ?, default)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserPwd());
			pstmt.setString(5, m.getEmail());
			pstmt.setDate(6, m.getBirth());
			pstmt.setString(7, m.getGender());
			

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update member set user_pwd = ?, email = ?, user_phone = ? where user_id = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getUserId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete member where user_id = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int checkId(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from member where user_id = ?";
		
		try {
			 pstmt = con.prepareStatement(query);
			 pstmt.setString(1, userId);
			 
			 rset = pstmt.executeQuery();
			 
			 if(rset.next()) {
				 result = rset.getInt(1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Member idsearch(Connection con, String userName, String email) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select user_id from member where user_name = ? and email = ?";
		
		try {
			 pstmt = con.prepareStatement(query);
			 
			 pstmt.setString(1, userName);
			 pstmt.setString(2, email);
			 
			 rset = pstmt.executeQuery();
			 
			 if(rset != null)
				 if(rset.next()) {
					 member = new Member();
					 member.setUserId(rset.getString("user_id"));
				 }
				 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public Member pwsearch(Connection con, String userId, String userName, String email) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(userId + "," + userName + "," + email);
		String query = "select user_pwd from member where user_id = ? and user_name = ? and email = ?";
		
		try {
			 pstmt = con.prepareStatement(query);
			 
			 pstmt.setString(1, userId);
			 pstmt.setString(2, userName);
			 pstmt.setString(3, email);
			 rset = pstmt.executeQuery();
			 
			 if(rset != null)
				 if(rset.next()) {
					 member = new Member();
					 member.setUserPwd(rset.getString("user_pwd"));
				 }
				 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

}
