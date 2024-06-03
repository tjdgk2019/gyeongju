package org.gyeongju.ctrl.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/QnaInsert.do")
public class QnaInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public QnaInsertCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("sid") == null) {
			response.sendRedirect("/gyeongju/Login.do");
			return;
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/community/insertQna.jsp");
		view.forward(request, response);
	}

}
