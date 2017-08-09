package order.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;

import menu.model.dao.MenuDao;
import menu.model.vo.Menu;
import order.model.dao.OrderDao;
import order.model.vo.Order;

public class OrderService {

	public int orderInsert(Order order) {
		Connection con = getConnection();

		int result = new OrderDao().orderInsert(con, order);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);
		return result;
	}

	public int orderNumSelect(Date paymentTime, int storeNum) {
		Connection con = getConnection();
		int orderNum = new OrderDao().orderNumSelect(con, paymentTime, storeNum);
		close(con);
		
		return orderNum;
	}

}
