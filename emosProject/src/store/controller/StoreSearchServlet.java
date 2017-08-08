package store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.model.service.StoreService;
import store.model.vo.Store;

@WebServlet("/ssearch")
public class StoreSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StoreSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String keyword = request.getParameter("search");
		
		ArrayList<Store> list = new StoreService().selectSearchList(keyword);

		
		RequestDispatcher view = null;
		if(list != null && list.size() > 0){
			view = request.getRequestDispatcher("views/store/search/search.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/store/search/search.jsp");
			request.setAttribute("message", "상호명 검색 결과 없음!");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
