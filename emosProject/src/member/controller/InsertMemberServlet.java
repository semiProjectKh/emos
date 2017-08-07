package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/ejoin")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 처리용 컨트롤러
				//1. 전송값에 한글이 있을 경우 문자인코딩 처리
				//응답처리에 컨텐츠타입 지정
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				
				//2. 전송값 꺼내서 변수에 기록하기
				String userName = request.getParameter("username");
				String userId = request.getParameter("id");
				String userPwd = request.getParameter("pw1");
				String gender = request.getParameter("gender");
				String email = request.getParameter("email");
				StringBuilder sb = new StringBuilder();
				sb.append(request.getParameter("phonef") + "-");
				sb.append(request.getParameter("phonem") + "-");
				sb.append(request.getParameter("phonet"));
				String phone = sb.toString();
				
				StringBuilder sb2 = new StringBuilder();
				sb2.append(request.getParameter("birthy") + "-");
				sb2.append(request.getParameter("birthm") + "-");
				sb2.append(request.getParameter("birthd"));
				
				Date birth = Date.valueOf(sb2.toString());
				
				Member m = new Member(userId, phone, userName, userPwd, email, birth, gender);
				
				System.out.println(m);
				//3. 비즈니스로직 처리용 모델 객체 생성과 메소드 호출 
				//리턴값 받기
				int result = new MemberService().insertMember(m);
					
				//4. 리턴값을 가지고 성공/실패에 대한 뷰페이지를 내보냄
				if(result > 0){//가입 성공
					response.sendRedirect("/emos/index.jsp");
				}else{//가입 실패
					RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
					request.setAttribute("message", "회원가입 실패!");
					view.forward(request, response);
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
