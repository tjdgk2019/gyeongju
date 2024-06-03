package org.gyeongju.ctrl.qna;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gyeongju.dao.CommunityDAO;
import org.gyeongju.dto.Community;


@WebServlet("/QnaList.do")
public class QnaListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public QnaListCtrl() {
    	super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CommunityDAO dao = new CommunityDAO();
		List<Community> qnaList = new ArrayList<>();
		qnaList = dao.getQnaList();
		request.setAttribute("qnaList", qnaList);
		RequestDispatcher view = request.getRequestDispatcher("/community/qnaList.jsp");
		view.forward(request, response);
	}

}
