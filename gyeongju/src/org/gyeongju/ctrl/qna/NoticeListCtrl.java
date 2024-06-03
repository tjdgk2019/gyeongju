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


@WebServlet("/NoticeList.do")
public class NoticeListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public NoticeListCtrl() {
    	super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CommunityDAO dao = new CommunityDAO();
		List<Community> noticeList = new ArrayList<>();
		noticeList = dao.getNoticeList();
		request.setAttribute("noticeList", noticeList);
		RequestDispatcher view = request.getRequestDispatcher("/community/noticeList.jsp");
		view.forward(request, response);
	}

}
