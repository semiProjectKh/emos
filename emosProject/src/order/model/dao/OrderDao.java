package order.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import menu.model.vo.Menu;
import order.model.vo.Order;

public class OrderDao {

	public int orderInsert(Connection con, Order order) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO ORD_TABLE VALUES (seq_order_num.nextval, ?, ?, 1, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, order.getStoreNum());
			pstmt.setDate(2, order.getOrderTime());
			pstmt.setInt(3, order.getOrder_way());
			pstmt.setInt(4, order.getUserNum());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int orderNumSelect(Connection con, Date paymentTime, int storeNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int orderNum = 0;
		
		String query = "SELECT * FROM ORD_TABLE WHERE ORDER_TIME = ? AND STORE_NUM = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, paymentTime);
			pstmt.setInt(2, storeNum);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				orderNum = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return orderNum;
	}

}
