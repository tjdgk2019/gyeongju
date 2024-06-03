package org.gyeongju.ctrl.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.CommunityDAO;
import org.gyeongju.dto.Community;

@WebServlet("/GetNotice.do")
public class GetNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetNoticeCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		CommunityDAO dao = new CommunityDAO();
		Community notice = dao.getCommunity(bno);
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("sid");
		
		request.setAttribute("notice", notice);
		request.setAttribute("sid", loginId);
		request.setAttribute("bno", bno);
		RequestDispatcher view = request.getRequestDispatcher("/community/getNotice.jsp");
		view.forward(request, response);
	}

}
