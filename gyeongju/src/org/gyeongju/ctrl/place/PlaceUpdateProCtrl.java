package org.gyeongju.ctrl.place;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.PlaceDAO;
import org.gyeongju.dto.Place;


@WebServlet("/PlaceUpdatePro.do")
public class PlaceUpdateProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PlaceUpdateProCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		if(!sid.equals("admin")){
			response.sendRedirect("/gyeongju");
		}
		
		Place place = new Place();
		place.setPno(Integer.parseInt(request.getParameter("pno")));
		place.setPname(request.getParameter("pname"));
		place.setPtype(request.getParameter("ptypeval"));
		place.setPaddr(request.getParameter("paddr"));
		place.setPtel(request.getParameter("ptel"));
		String pcomm = request.getParameter("pcomm").replace("\r\n","<br>");
		place.setPcomm(pcomm);
		place.setItem(request.getParameter("item"));
		
		String ptype = "";
		if(request.getParameter("ptype").equals("all")) {
			ptype = "all";
		} else if (place.getPtype().equals("문화재")) {
			ptype ="curtural";
		} else if (place.getPtype().equals("테마파크/공원")) {
			ptype ="theme";
		} else if (place.getPtype().equals("기타")) {
			ptype ="etc";
		} 
		
		PlaceDAO dao = new PlaceDAO();
		int cnt = dao.updatePlace(place);
		
		if(cnt>0) {
			response.sendRedirect("/gyeongju/GetPlace.do?ptype="+ptype+"&pno="+place.getPno());
		} else {
			response.sendRedirect("/gyeongju/PlaceUpdate.do?ptype="+ptype+"&pno="+place.getPno());
		}
	}

}
