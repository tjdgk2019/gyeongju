package org.gyeongju.ctrl.food;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.FoodDAO;


@WebServlet("/FoodDelete.do")
public class FoodDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodDeleteCtrl() {
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
		
		String ftype = request.getParameter("ftype");
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FoodDAO dao = new FoodDAO();
		
		String filename = dao.getFood(fno).getFilename();
		String filepath = request.getServletContext().getRealPath("/upload/food/")+filename;
		File delFile = new File(filepath);
		delFile.delete();
		
		int cnt = dao.deleteFood(fno);
		
		if(cnt>0) {
			response.sendRedirect("/gyeongju/FoodList.do?ftype="+ftype);
		} else {
			response.sendRedirect("/gyeongju/GetFood.do?ftype="+ftype+"&fno="+fno);
		}
	}

}
