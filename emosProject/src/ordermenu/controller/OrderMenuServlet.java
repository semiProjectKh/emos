package ordermenu.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.model.service.MenuService;
import order.model.service.OrderService;
import order.model.vo.Order;
import ordermenu.model.service.OrderMenuService;
import ordermenu.model.vo.OrderMenu;

/**
 * Servlet implementation class OrderMenuServlet
 */
@WebServlet("/mporder")
public class OrderMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; utf-8");

		ArrayList<OrderMenu> list = new ArrayList<OrderMenu>();
		OrderMenu om = null;
		
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		String[] menuNum = request.getParameterValues("menuNum[]");
		String[] menuCnt = request.getParameterValues("mcnt[]");
		
		// 콜백 받은 배열을 디비에 처리하기위해 형변환
		int [] mCnt = new int[menuCnt.length];
		int [] mNum = new int[menuNum.length];
		for (int i=0; i<menuCnt.length; i++) {
			mCnt[i] = Integer.parseInt(menuCnt[i]);
			mNum[i] = Integer.parseInt(menuNum[i]);
			
			om = new OrderMenu();
			om.setOrderNum(orderNum);
			om.setMenuNum(mNum[i]);
			om.setMenuCnt(mCnt[i]);
			
			list.add(om);
		}
		System.out.println("서블릿 리스트 사이즈" + list.size());
		// 장바구니에 닮겨있는 메뉴들을 처리하기 위햔 작업
		new OrderMenuService().orderMenuInsert(list);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
