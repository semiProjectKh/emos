package common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection(){
		Connection con = null;
		Properties prop = new Properties();

		try {
			String currentPath = JDBCTemplate.class
					.getResource("./").getPath();
			prop.load(new FileReader(currentPath + "driver.properties"));
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("id");
			String pwd = prop.getProperty("pwd");

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			
			con.setAutoCommit(false);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
	
	public static void close(Connection con){
		try {
			if(!con.isClosed()){
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt){
		try {
			if(!stmt.isClosed()){
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset){
		try {
			if(!rset.isClosed()){
				rset.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con){
		try {
			if(!con.isClosed()){
				con.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con){
		try {
			if(!con.isClosed()){
				con.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
