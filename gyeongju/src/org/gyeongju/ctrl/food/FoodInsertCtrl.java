package org.gyeongju.ctrl.food;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.FoodDAO;
import org.gyeongju.dto.Food;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FoodInsert.do")
public class FoodInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodInsertCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		if(!sid.equals("admin")){
			response.sendRedirect("/gyeongju");
		}
		
		Food food = new Food();
		ServletContext application = request.getServletContext();
		
		try {
			String saveDirectory = application.getRealPath("/upload/food");
			
			File isDir = new File(saveDirectory);
			if(!isDir.isDirectory()) {
				isDir.mkdir();
			}
			
			int maxSize = 1024*1024*10;
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
			
			food.setFname(mr.getParameter("fname"));
			food.setFtype(mr.getParameter("ftypeval"));
			food.setFtel(mr.getParameter("ftel"));
			food.setFaddr(mr.getParameter("faddr"));
			String fcomm = mr.getParameter("fcomm").replace("\r\n","<br>");
			food.setFcomm(fcomm);
			
			//파일 추가
			Enumeration files = mr.getFileNames();
			String item = (String) files.nextElement();
			
			String oriFile = mr.getOriginalFileName(item);
			String fName = mr.getFilesystemName(item);
			File upfile = mr.getFile(item);
			food.setFilename(fName);
			
			FoodDAO dao = new FoodDAO();
			int cnt = dao.insertFood(food);
			String ftype = request.getParameter("ftype");
			
			if(cnt>0) {
				response.sendRedirect("/gyeongju/FoodList.do?ftype=all");
			} else {
				response.sendRedirect("/gyeongju/food/insertFood.jsp?ftype="+ftype);
			}
			
			
		} catch(Exception e) {
			
		}
		
		
	}

}
