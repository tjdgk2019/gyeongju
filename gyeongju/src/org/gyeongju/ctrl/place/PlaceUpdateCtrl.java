package org.gyeongju.ctrl.place;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.PlaceDAO;
import org.gyeongju.dto.Place;

@WebServlet("/PlaceUpdate.do")
public class PlaceUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PlaceUpdateCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		if(!sid.equals("admin")){
			response.sendRedirect("/gyeongju");
		}
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		PlaceDAO dao = new PlaceDAO();
		Place place = dao.getPlace(pno);
		String contents = place.getPcomm().replace("<br>", "\r\n");
		place.setPcomm(contents);
		String ptypeOp = place.getPtype();
		String ptype = request.getParameter("ptype");
		
		request.setAttribute("place", place);
		request.setAttribute("ptypeOp", ptypeOp);
		request.setAttribute("ptype", ptype);
		
		RequestDispatcher view = request.getRequestDispatcher("/place/editPlace.jsp");
		view.forward(request, response);
	}

}
