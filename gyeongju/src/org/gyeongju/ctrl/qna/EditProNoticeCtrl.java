package org.gyeongju.ctrl.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gyeongju.dao.CommunityDAO;
import org.gyeongju.dto.Community;

@WebServlet("/EditProNotice.do")
public class EditProNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProNoticeCtrl() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Community com = new Community();
		com.setBno(Integer.parseInt(request.getParameter("bno")));
		com.setTitle(request.getParameter("title"));
		String contents = request.getParameter("content").replace("\r\n","<br>");
		com.setContent(contents);
		
		CommunityDAO dao = new CommunityDAO();
		int cnt = dao.editProCommunity(com);
		
		if(cnt>0) {
			response.sendRedirect("/gyeongju/GetNotice2.do?bno="+com.getBno());
		} else {
			response.sendRedirect("/gyeongju/EditNotice.do?bno="+com.getBno());
		}
	}

}
