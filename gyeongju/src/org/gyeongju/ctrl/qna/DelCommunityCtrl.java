package org.gyeongju.ctrl.qna;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.CommunityDAO;

@WebServlet("/DelCommunity.do")
public class DelCommunityCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelCommunityCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));

		CommunityDAO dao = new CommunityDAO();
		
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		String aid = dao.getCommunity2(bno).getAid();
		
		if(sid.equals("admin")|| sid.equals(aid)){
			
		} else {
			response.sendRedirect("/gyeongju");
			return;
		}
		
		String filename = dao.getCommunity2(bno).getFilename();
		String filepath = request.getServletContext().getRealPath("/upload/community/")+filename;
		File delFile = new File(filepath);
		delFile.delete();
		
		int cnt = dao.delCommunity(bno);
		
		String redirectURL = "";
		
		if(cnt>0) {
			if (request.getParameter("t").equals("notice")) {
				redirectURL = "/gyeongju/NoticeList.do";
			} else if (request.getParameter("t").equals("qna")){
				redirectURL = "/gyeongju/QnaList.do";
			}
		} else {
			if (request.getParameter("t").equals("qna")) {
				redirectURL = "/gyeongju/GetQna2.do?bno="+bno;
				
			} else {
				redirectURL = "/gyeongju/GetNotice2.do?bno="+bno;
			}
			
		}
		response.sendRedirect(redirectURL);
	}

}
