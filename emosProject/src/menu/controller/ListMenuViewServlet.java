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
 * Servlet implementation class ListMenuViewServlet
 */
@WebServlet("/lmenuview")
public class ListMenuViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListMenuViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		// 스토어넘버에 jsp단에서 받은 storeNum 콜백하면 됨
		int storeNum = 2;
		
		// 메뉴창 네비바 작업용 리스트
		ArrayList listType = new MenuService().typeList(storeNum);
		
		// 리스트의 널값 제거
		for (int i=0; i<listType.size(); i++) {
			
			if (listType.get(i) == null)
				listType.remove(i);
		}
		
		// 메뉴 리스트
		ArrayList<Menu> list = new MenuService().selectMenuList(storeNum);
		
		
		RequestDispatcher view = null;

		if (listType != null && listType.size() > 0) {
			view = request.getRequestDispatcher("views/menu/menuOrder.jsp");
			request.setAttribute("listType", listType);
			request.setAttribute("list", list);
			
			view.forward(request, response);
		}
		else
			System.out.println("에러");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
