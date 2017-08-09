package order.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class OrderMenuServlet
 */
@WebServlet("/morder")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
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
		response.setContentType("text/plain; utf-8");
		
		// 결제 api로 받는 결제수단에 대한 변수 (payment_method)
		int paymentMethod = 0;
		
		// 시간 처리용 메소드 (결제 api로 결제완료 시간 받을 때 변경하면 됨)
		String date = request.getParameter("paymentTime");

		Date paymentTime = new Date(
				new GregorianCalendar(Integer.parseInt(date.substring(0, 4)), Integer.parseInt(date.substring(4, 6)),
						Integer.parseInt(date.substring(6, 8)), Integer.parseInt(date.substring(8, 10)),
						Integer.parseInt(date.substring(10, 12)), Integer.parseInt(date.substring(12, 14)))
								.getTimeInMillis());

		int storeNum = Integer.parseInt(request.getParameter("storeNum"));
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		
		// 결제 수단 처리용
		if (request.getParameter("paymentMethod").equals("card")) {
			// 카드결제시
			paymentMethod = 1;
		} else {
			// 현금결제시
			paymentMethod = 2;
		}
		
		// jsp단에서 받은 배열
		String[] menuNum = request.getParameterValues("menuNum[]");
		String[] menuCnt = request.getParameterValues("mcnt[]");
		System.out.println("오더서블릿 리스트 사이즈" + menuNum.length + ", " + menuCnt.length);

		Order order = new Order(storeNum, paymentTime, paymentMethod, memberNum);

		int result = new OrderService().orderInsert(order);
		RequestDispatcher view = null;

		if (result > 0) {
			// 생성된 주문번호를 받는 변수
			int orderNum = new OrderService().orderNumSelect(paymentTime, storeNum); 

			// ordermenuServlet단으로 보내주는 작업
			view = request.getRequestDispatcher("mporder?orderNum="+orderNum+"&menuNum="+menuNum+"&menuCnt="+menuCnt);
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
