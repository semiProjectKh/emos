package menu.model.service;

import java.sql.Connection;
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

}
