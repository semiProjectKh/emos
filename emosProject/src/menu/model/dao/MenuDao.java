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

		String query = "INSERT ALL";
		for (int i = 0; i < list.size(); i++) {
			if (i != list.size())
				query += "INTO MENU VALUES(seq_menu_num.nextval, 2, ?, ?, ?),";
			else
				query += "INTO MENU VALUES(seq_menu_num.nextval, 2, ?, ?, ?)";
		}
		try {

			pstmt = con.prepareStatement(query);
			for (int j = 0, k = 1; j < list.size(); j++) {
				pstmt.setString(k++, list.get(j).getMenuName());
				pstmt.setInt(k++, list.get(j).getPrice());
				pstmt.setString(k++, list.get(j).getMenuType());
				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
