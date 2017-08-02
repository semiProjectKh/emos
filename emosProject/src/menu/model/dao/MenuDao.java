package menu.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import menu.model.vo.Menu;
import static common.JDBCTemplate.*;

public class MenuDao {

	public int menuInsert(Connection con, ArrayList<Menu> list) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT ALL ";
		for (int i = 0; i < list.size(); i++) {
			if (i != list.size()-1)
				query += "INTO MENU VALUES ((select max(menu_num) from menu) + " + (i+1) + ", 2, ?, ?, ?) ";
			else
				query += "INTO MENU VALUES ((select max(menu_num) from menu) + " + (i+1) + ", 2, ?, ?, ?) SELECT * FROM DUAL";
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			int k =1;
			for (int j = 0; j < list.size(); j++) {
				pstmt.setString(k++, list.get(j).getMenuName());
				pstmt.setInt(k++, list.get(j).getPrice());
				pstmt.setString(k++, list.get(j).getMenuType());
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
