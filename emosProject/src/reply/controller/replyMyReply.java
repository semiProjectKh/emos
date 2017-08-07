package reply.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reply.model.service.ReplyService;
import reply.model.vo.Reply;

/**
 * Servlet implementation class replyMyReply
 */
@WebServlet("/einfo")
public class replyMyReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replyMyReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=8");
		
		String userId = request.getParameter("userid");
		System.out.println(userId);
		int result = Integer.parseInt(request.getParameter("num"));
		
		RequestDispatcher views = null;
		if(result == 1){
			ArrayList<Reply> list = new ReplyService().recentTop5(userId);
		
			if(list != null && list.size() > 0){
				views = request.getRequestDispatcher("views/member/myinfo.jsp");
				request.setAttribute("replylist", list);
				views.forward(request, response);
			}else{
				
			}
		}
		
		if(result == 2){
			ArrayList<Reply> list = new ReplyService().myReply(userId);
		
			if(list != null && list.size() > 0){
				views = request.getRequestDispatcher("views/reply/detailReply.jsp");
				request.setAttribute("detailList", list);
				views.forward(request, response);
			}else{
			
			}
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
