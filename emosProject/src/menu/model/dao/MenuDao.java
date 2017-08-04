package menu.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

	public ArrayList<Menu> selectMenuList(Connection con, int storeNum) {
		ArrayList<Menu> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM MENU WHERE STORE_NUM = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				list = new ArrayList<Menu>();
				while (rset.next()) {
					Menu m = new Menu();
					m.setMenuNum(rset.getInt("MENU_NUM"));
					m.setStoreNum(rset.getInt("STORE_NUM"));
					m.setMenuName(rset.getString("MENU_NAME"));
					m.setPrice(rset.getInt("PRICE"));
					m.setMenuType(rset.getString("MENU_TYPE"));
					System.out.println(m.toString());
					list.add(m);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteMenu(Connection con, int menuNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM MENU WHERE MENU_NUM = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, menuNum);
			
			result = pstmt.executeUpdate();
			
			System.out.println("dao result값 = " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Menu selectMenu(Connection con, int menuNum) {
		Menu m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM MENU WHERE MENU_NUM = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, menuNum);
			
			rset = pstmt.executeQuery();
			if (rset != null) {
				if (rset.next()) {
					m = new Menu();
					m.setMenuNum(menuNum);
					m.setStoreNum(rset.getInt("STORE_NUM"));
					m.setMenuName(rset.getString("MENU_NAME"));
					m.setPrice(rset.getInt("PRICE"));
					m.setMenuType(rset.getString("MENU_TYPE"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int updateMenu(Connection con, Menu m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE MENU SET MENU_NAME = ?, PRICE = ?, MENU_TYPE = ? WHERE MENU_NUM = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMenuName());
			pstmt.setInt(2, m.getPrice());
			pstmt.setString(3, m.getMenuType());
			pstmt.setInt(4, m.getMenuNum());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList typeList(Connection con, int storeNum) {
		PreparedStatement pstmt = null;
		ArrayList listType = null;
		ResultSet rset = null;
		String query = "SELECT DISTINCT MENU_TYPE FROM MENU WHERE STORE_NUM = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				listType = new ArrayList();
				int i = 0;
				while (rset.next()) {
					listType.add(rset.getString("MENU_TYPE"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listType;
	}

	public ArrayList<Menu> selectMenuList(Connection con, int storeNum, String mCategory) {
		ArrayList<Menu> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM MENU WHERE STORE_NUM = ? AND MENU_TYPE = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, storeNum);
			pstmt.setString(2, mCategory);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				list = new ArrayList<Menu>();
				while (rset.next()) {
					Menu m = new Menu();
					m.setMenuNum(rset.getInt("MENU_NUM"));
					m.setStoreNum(rset.getInt("STORE_NUM"));
					m.setMenuName(rset.getString("MENU_NAME"));
					m.setPrice(rset.getInt("PRICE"));
					m.setMenuType(rset.getString("MENU_TYPE"));
					System.out.println(m.toString());
					list.add(m);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
