package org.gyeongju.ctrl.place;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.PlaceDAO;


@WebServlet("/PlaceDelete.do")
public class PlaceDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PlaceDeleteCtrl() {
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
		
		String ptype = request.getParameter("ptype");
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		PlaceDAO dao = new PlaceDAO();
		
		String filename = dao.getPlace(pno).getFilename();
		String filepath = request.getServletContext().getRealPath("/upload/place/")+filename;
		File delFile = new File(filepath);
		delFile.delete();
		
		int cnt = dao.deletePlace(pno);
		
		if(cnt>0) {
			response.sendRedirect("/gyeongju/PlaceList.do?ptype="+ptype);
		} else {
			response.sendRedirect("/gyeongju/getPlace.do?ptype="+ptype+"&pno="+pno);
		}
	}

}
