package org.gyeongju.ctrl.place;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gyeongju.dao.PlaceDAO;
import org.gyeongju.dto.Place;

@WebServlet("/GetPlace.do")
public class GetPlaceCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public GetPlaceCtrl() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ptype = request.getParameter("ptype");
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		PlaceDAO dao = new PlaceDAO();
		Place place = dao.getPlace(pno);
		if (place.getPtel()==null) {
			place.setPtel("정보 없음");
		}
		String ptypeVal = place.getPtype();
		request.setAttribute("ptypeVal", ptypeVal);
		
		request.setAttribute("ptype", ptype);
		request.setAttribute("place", place);
		RequestDispatcher view = request.getRequestDispatcher("/place/getPlace.jsp");
		view.forward(request, response);
	}

}
