package menu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.model.service.MenuService;
import menu.model.vo.Menu;

/**
 * Servlet implementation class DeleteMenuServlet
 */
@WebServlet("/mdelete")
public class DeleteMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; utf-8");
		int menuNum = Integer.parseInt(request.getParameter("menuNum"));
		
		MenuService mservice = new MenuService();
		
		int result = new MenuService().deleteMenu(menuNum);
		
		PrintWriter clientOut = response.getWriter();
		
		if (result > 0) {
			clientOut.append("1");
			clientOut.flush();
		} else {
			clientOut.append("0");
			clientOut.flush();
		}
		clientOut.close();
		
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
