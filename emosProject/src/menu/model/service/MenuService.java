package menu.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import menu.model.dao.MenuDao;
import menu.model.vo.Menu;
import static common.JDBCTemplate.*;

public class MenuService {

	public int menuInsert(ArrayList<Menu> list) {
		Connection con = getConnection();

		int result = new MenuDao().menuInsert(con, list);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);
		return result;

	}

	public ArrayList<Menu> selectMenuList(int storeNum) {
		Connection con = getConnection();
		ArrayList<Menu> list = new MenuDao().selectMenuList(con, storeNum);

		close(con);
		return list;
	}

	public int deleteMenu(int menuNum) {
		Connection con = getConnection();

		int result = new MenuDao().deleteMenu(con, menuNum);

		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
	}

	public Menu selectMenu(int menuNum) {
		Connection con = getConnection();
		Menu m = new MenuDao().selectMenu(con, menuNum);
		close(con);
		
		return m;
	}

	public int updateMenu(Menu m) {
		Connection con = getConnection();
		
		int result = new MenuDao().updateMenu(con, m);
		
		if (result > 0)
			commit(con);
		else
			rollback(con);
		
		return result;
			
	}
}
