package menu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.model.service.MenuService;

/**
 * Servlet implementation class UpdateMenuServlet
 */
@WebServlet("/mupdate")
public class UpdateMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; utf-8");
		int menuNum = Integer.parseInt(request.getParameter("menuNum"));
		String menuName = request.getParameter("menuName");
		
		System.out.println(menuNum + menuName);
		
		
		/*MenuService mservice = new MenuService();
		
		int result = new MenuService().deleteMenu(menuNum);
		
		PrintWriter clientOut = response.getWriter();
		
		if (result > 0) {
			clientOut.append("1");
			clientOut.flush();
		} else {
			clientOut.append("0");
			clientOut.flush();
		}
		clientOut.close();*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
