package org.gyeongju.ctrl.help;

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

import org.gyeongju.dao.DataDAO;
import org.gyeongju.dto.Data;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/DataInsertPro.do")
public class DataInsertProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataInsertProCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession();
			String sid = (String) session.getAttribute("sid");
			if(!sid.equals("admin")){
				response.sendRedirect("/gyeongju");
			}
			
			Data data = new Data();
			
			ServletContext application = request.getServletContext();
			String saveDirectory = application.getRealPath("/upload/data");
			int maxSize = 52428800;
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
			
			data.setTitle(mr.getParameter("title"));
			String contents = mr.getParameter("content").replace("\r\n","<br>");
			data.setContent(contents);
			data.setFilename(mr.getParameter("filename"));
			
			Enumeration files = mr.getFileNames();
			String item = (String) files.nextElement(); 			
			
			String oriFile = mr.getOriginalFileName(item); 
			String datafile = mr.getFilesystemName(item);

			File upfile = mr.getFile(item);	 
			data.setFilename(datafile);
			DataDAO dao = new DataDAO();
			int cnt = dao.insData(data);
			

			String home = application.getContextPath();
			if(cnt>0) {
				response.sendRedirect(home+"/DataList.do");
			} else {
				response.sendRedirect(home+"/data/insertData.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
