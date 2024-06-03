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

@WebServlet("/EditQna.do")
public class EditQnaCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditQnaCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("sid");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		CommunityDAO dao = new CommunityDAO();
		Community qna = dao.getCommunity2(bno);
		String contents = qna.getContent().replace("<br>", "\r\n");
		qna.setContent(contents);
		
		if (loginId == null) {
			response.sendRedirect("/gyeongju/Login.do");
		}
		if(!loginId.equals(qna.getAid())) {
			response.sendRedirect("/QnaList.do");
		} 
		
		request.setAttribute("qna", qna);
		RequestDispatcher view = request.getRequestDispatcher("/community/editQna.jsp");
		view.forward(request, response);
	}

}
