package org.gyeongju.ctrl.qna;

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

import org.gyeongju.dao.CommunityDAO;
import org.gyeongju.dto.Community;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/QnaInsertPro.do")
public class QnaInsertProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnaInsertProCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		if(sid==null){
			response.sendRedirect("/gyeongju");
		}
		
		Community com= new Community ();
		
		ServletContext application = request.getServletContext();
		
		try {
			String saveDirectory = application.getRealPath("/upload/community");
			int maxSize = 1024*1024*10;
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
			
			String contents = mr.getParameter("content").replace("\r\n","<br>");
			com.setTitle(mr.getParameter("title"));
			com.setContent(contents);
			com.setAid((String) session.getAttribute("sid"));
			
			Enumeration files = mr.getFileNames();
			String item = (String) files.nextElement(); 			
			
			String oriFile = mr.getOriginalFileName(item); 
			String fileName = mr.getFilesystemName(item);

			File upfile = mr.getFile(item);	 
			com.setFilename(fileName);
			CommunityDAO dao = new CommunityDAO();
			int cnt = dao.insCommunity(com);
			
	
			
			String home = application.getContextPath();
			if(cnt>0) {
				response.sendRedirect(home+"/QnaList.do");
			} else {
				response.sendRedirect(home+"/community/insertQna.jsp");
			}
		} catch(Exception e) {
				e.printStackTrace();
			}
	}

}
