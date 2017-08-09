package ordermenu.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import ordermenu.model.dao.OrderMenuDao;
import ordermenu.model.vo.OrderMenu;

public class OrderMenuService {

	public int orderMenuInsert(ArrayList<OrderMenu> list) {
		Connection con = getConnection();

		int result = new OrderMenuDao().OrderMenuInsert(con, list);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);
		
		return result;
	}

}
