package menu.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.model.vo.Menu;

import static common.JDBCTemplate.*;

@WebServlet("/mview")
public class MenuViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MenuViewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		ArrayList<Menu> marr = null;
		Menu mm = null;

		// int store = Integer.parseInt(request.getParameter("storeNum"));
		int store = 1;
		try {
			Connection con = getConnection();
			PreparedStatement pre = con.prepareStatement("select*from menu where store_num = ?");
			pre.setInt(1, store);
			ResultSet rs = pre.executeQuery();

			if (rs.next()) {
				marr = new ArrayList<Menu>();
				do {
					mm = new Menu(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getDouble(5),
							rs.getDouble(6), rs.getDouble(7), rs.getInt(8), rs.getString(9), rs.getInt(10));
					
					System.out.println(mm.toString());

					marr.add(mm);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (marr != null && marr.size() > 0) {
			// 절대경로 사용 못 함
			RequestDispatcher view = request.getRequestDispatcher("views/menuview.jsp");
			request.setAttribute("list", marr);
			view.forward(request, response);
		} else {
			response.sendRedirect("/emos/error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
