package store.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import store.model.service.StoreService;
import store.model.vo.StoreImage;

/**
 * Servlet implementation class StoreImageServlet
 */
@WebServlet("/simg")
public class StoreImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StoreImageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int storeNum = Integer.parseInt(request.getParameter("storeNum"));
		
		if (request.getParameter("up").equals("1")) {
			int maxSize = 1024 * 1024 * 10; // 최대 10Mbyte까지

			RequestDispatcher view = null;
			// enctype="multipart/form-date" 로 전송되었는지 확인
			if (!ServletFileUpload.isMultipartContent(request)) {
				view = request.getRequestDispatcher("views/store/storeError.jsp");

				request.setAttribute("message", "form enctype 속성 사용 안 됨!");
				view.forward(request, response);
			}

			String root = request.getSession().getServletContext().getRealPath("/");

			String savePath = root + "storeImg\\" + storeNum;

			MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());

			String mainFileName = mrequest.getFilesystemName("mimg");
			String img1 = mrequest.getFilesystemName("img1");
			String img2 = mrequest.getFilesystemName("img2");
			String img3 = mrequest.getFilesystemName("img3");

			StoreImage simg = new StoreImage(storeNum, null, null, null, null);

			if (mainFileName != null) {
				String renameFileName = "Main." + mainFileName.substring(mainFileName.lastIndexOf(".") + 1);

				// 파일명 바꾸기하려면 File 객체의 renameTo() 사용함
				File originFile = new File(savePath + "\\" + mainFileName);
				File renameFile = new File(savePath + "\\" + renameFileName);

				// 파일이름 바꾸기 실행 >> 실패할 경우 직접 바꾸기함
				// 새 파일만들고 원래 파일내용 읽어서 복사 기록 후 원 파일 삭제
				if (!originFile.renameTo(renameFile)) {
					int read = -1;
					byte[] buf = new byte[1024]; // 한 번에 읽을 배열 크기 지정
					FileInputStream fin = new FileInputStream(originFile);
					FileOutputStream fout = new FileOutputStream(renameFile);

					while ((read = fin.read(buf, 0, buf.length)) != -1) {
						fout.write(buf, 0, buf.length);
					}

					fin.close();
					fout.close();
					originFile.delete(); // 원본 파일 삭제함

				}
				simg.setImgMain(renameFileName);
			}
			if (new StoreService().insertImage(simg) > 0) {
				view = request.getRequestDispatcher("views/store/storeImage.jsp");
				request.setAttribute("simg", simg);
				view.forward(request, response);
			} else {
				view = request.getRequestDispatcher("views/store/storeError.jsp");
				request.setAttribute("message", "사진 등록 서비스 실패!");
			}
		} else {
			StoreImage simg = new StoreService().selectStoreImg(storeNum);
			response.sendRedirect("views/store/storeImage.jsp");
			request.setAttribute("simg", simg);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
