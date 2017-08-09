package menu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.model.service.MenuService;
import menu.model.vo.Menu;

/**
 * Servlet implementation class MenuUpdateViewServlet
 */
@WebServlet("/mupview")
public class UpdateMenuViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateMenuViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		// jsp단에서 받은 storeNum 사용하면 됨
		int storeNum = 2;
		
		// 업데이트 화면에 뿌려줄 리스트
		ArrayList<Menu> list = new MenuService().selectMenuList(storeNum);

		RequestDispatcher view = null;
		
		// 업데이트 화면에 콜백할 리스트
		if (list != null && list.size() > 0) {
			view = request.getRequestDispatcher("views/menu/menuUpdateForm.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		} else {
			System.out.println("에러");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
