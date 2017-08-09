package ordermenu.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import ordermenu.model.vo.OrderMenu;

public class OrderMenuDao {

	public int OrderMenuInsert(Connection con, ArrayList<OrderMenu> list) {
		System.out.println("리스트 사이즈" + list.size());
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT ALL ";
		for (int i = 0; i < list.size(); i++) {
			if (i != list.size()-1)
				query += "INTO ORDER_MENU VALUES ((SELECT MAX(ORDER_MENU_NUM) FROM ORDER_MENU) + " + (i+1) + ", ?, ?, ?, (SELECT PRICE FROM MENU WHERE MENU_NUM = ?)) ";
			else
				query += "INTO ORDER_MENU VALUES ((SELECT MAX(ORDER_MENU_NUM) FROM ORDER_MENU) + " + (i+1) + ", ?, ?, ?, (SELECT PRICE FROM MENU WHERE MENU_NUM = ?)) SELECT * FROM DUAL";
		}
		
		try {
			pstmt = con.prepareStatement(query);
			int k =1;
			for (int j = 0; j < list.size(); j++) {
				pstmt.setInt(k++, list.get(j).getOrderNum());
				pstmt.setInt(k++, list.get(j).getMenuNum());
				pstmt.setInt(k++, list.get(j).getMenuCnt());
				pstmt.setInt(k++, list.get(j).getMenuNum());
			}
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
