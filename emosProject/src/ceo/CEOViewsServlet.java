package ceo;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import store.model.vo.Store;

import static common.JDBCTemplate.*;

@WebServlet("/ceoinfo")
public class CEOViewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CEOViewsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		Store store = null;
		String query = "select * from store where store_num = ?";
		Connection con = getConnection();
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1, request.getParameter("storeNum"));
			ResultSet rset = pre.executeQuery();

			if (rset.next()) {
				store = new Store(rset.getString(1), rset.getString(2), rset.getInt(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9),
						rset.getString(10), rset.getString(11), rset.getString(12), rset.getString(13),
						rset.getString(14), rset.getDate(15), rset.getString(16), rset.getInt(17));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (store != null) {
			RequestDispatcher view = request.getRequestDispatcher("views/store/storeMyView.jsp");
			request.setAttribute("store", store);
			view.forward(request, response);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "로그인 실패!");
			view.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
