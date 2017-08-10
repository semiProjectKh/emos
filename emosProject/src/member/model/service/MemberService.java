package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	
	public MemberService() {}
	
	public Member selectMember(String userId, String userPwd){
		Connection con = getConnection();
		Member loginMember = new MemberDao().selectMember(con, userId, userPwd);
		
		close(con);
		
		return loginMember;
		
	}

	public int insertMember(Member m) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, m);
		
		//커밋 롤백은 컨넥션 얻어온 곳에서 해야한다
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}

	public int updateMember(Member m) {
		Connection con = getConnection();
		int result = new MemberDao().updateMember(con, m);
		
		//커밋 롤백은 컨넥션 얻어온 곳에서 해야한다
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}

	public int deleteMember(String userId) {
		Connection con = getConnection();
		int result = new MemberDao().deleteMember(con, userId);
		
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}
	
	public int checkId(String userId) {
		Connection con = getConnection();
		int result = new MemberDao().checkId(con, userId);
		
		close(con);
		
		return result;
	}
	
	public Member idSearch(String userName, String email) {
		Connection con = getConnection();
		Member idSearch = new MemberDao().idsearch(con, userName, email);
		
		close(con);
		
		return idSearch;
	}

	public Member pwSearch(String userId, String userName, String email) {
		Connection con = getConnection();
		Member pwSearch = new MemberDao().pwsearch(con, userId, userName, email);
		
		close(con);
		
		return pwSearch;
	}
	
	public ArrayList<Member> paylist (int userNum) {
		Connection con = getConnection();
		ArrayList<Member> pay = new MemberDao().paylist(con, userNum);
		
		close(con);
		
		return pay;
	}
}
