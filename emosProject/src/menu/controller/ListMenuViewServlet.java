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

		int storeNum = 2;
		ArrayList listType = new MenuService().typeList(storeNum);
		
		String mCategory = request.getParameter("menuType");
		
		if (mCategory == null) {
			mCategory = (String) listType.get(0);
		}
		
		System.out.println(mCategory);
		
		ArrayList<Menu> list = new MenuService().selectMenuList(storeNum);
		System.out.println(list);
		
		RequestDispatcher view = null;
		
		for (int i=0; i<listType.size(); i++) {
			
			if (listType.get(i) == null)
				listType.remove(i);
		}
		
		
		
		
		
		if (listType != null && listType.size() > 0) {
			view = request.getRequestDispatcher("views/menu/menuOrder.jsp");
			request.setAttribute("listType", listType);
			request.setAttribute("list", list);
			request.setAttribute("mCategory", mCategory);
			
			view.forward(request, response);
		}
		else
			System.out.println("에러");

		/*RequestDispatcher view = null;

		if (list != null && list.size() > 0) {
			view = request.getRequestDispatcher("views/menu/menuUpdateForm.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		} else {
			System.out.println("에러");
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
