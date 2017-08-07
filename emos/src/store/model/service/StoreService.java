package store.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.ArrayList;

import store.model.dao.StoreDao;
import store.model.vo.Store;

public class StoreService {
	public StoreService() {
	}

	public ArrayList<Store> selectList() { // + current, limit
		Connection con = getConnection();
		ArrayList<Store> list = new StoreDao().selectList(con);

		close(con);
		return list;
	}

	public ArrayList<Store> selectCategoryList(String category) { // + current,
																	// limit
		Connection con = getConnection();
		ArrayList<Store> list = new StoreDao().selectCategoryList(con, category);

		close(con);
		return list;
	}

	public Store selectOne(int storeNum) {
		Connection con = getConnection();

		Store store = new StoreDao().selectOne(con, storeNum);

		close(con);
		return store;
	}
	
	public Store selectOne(String storeId, String storePwd) {
		Connection con = getConnection();

		Store store = new StoreDao().selectOne(con, storeId, storePwd);

		close(con);
		return store;
	}
	
	public int insertStore(Store store) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().insertStore(con, store);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int deleteStore(int storeNum) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().deleteStore(con, storeNum);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int updateStore(Store store) {
		Connection con = getConnection();
		int result = 0;
		
		result = new StoreDao().updateStore(con, store);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public ArrayList<Store> selectSearchList(String keyword) {
		Connection con = getConnection();
		ArrayList<Store> list = new StoreDao().selectSearchList(con, keyword);

		close(con);
		return list;
	}
	
	public String addressConvert() {
        String clientId = "c9peV05tyKffEh9bvxes";
        String clientSecret = "VNUaAgdsfl";
        StringBuffer response = null;
        try {
            String addr = URLEncoder.encode("불정로 6", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/map/geocode?query=" + addr; //json
            //String apiURL = "https://openapi.naver.com/v1/map/geocode.xml?query=" + addr; // xml
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            
            
        } catch (Exception e) {
        	e.getStackTrace();
        }
        
        return response.toString();
    }
}
