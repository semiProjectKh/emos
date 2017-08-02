package menu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import menu.model.service.MenuService;
import menu.model.vo.Menu;

/**
 * Servlet implementation class InsertMenuServlet
 */
@WebServlet("/mninsert")
public class InsertMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertMenuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		/*
		 * JSONObject json d= new JSONObject(); JSONArray jarr = new JSONArray();
		 */

		ArrayList<Menu> list = new ArrayList<Menu>();
		Menu menu = null;
		int k = 1;

		while (true) {
			if (request.getParameter("menuname" + k) == null)
				break;
			menu = new Menu();
			menu.setMenuName(request.getParameter("menuname" + k));
			menu.setPrice(Integer.parseInt(request.getParameter("price" + k)));
			menu.setMenuType(request.getParameter("mtype"+k));
			list.add(menu);
			
			k++;
		}
		
		int result = new MenuService().menuInsert(list);
		
		
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
