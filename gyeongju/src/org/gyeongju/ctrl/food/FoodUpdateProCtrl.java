package org.gyeongju.ctrl.food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.FoodDAO;
import org.gyeongju.dto.Food;


@WebServlet("/FoodUpdatePro.do")
public class FoodUpdateProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FoodUpdateProCtrl() {
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
		
		Food food = new Food();
		food.setFno(Integer.parseInt(request.getParameter("fno")));
		food.setFname(request.getParameter("fname"));
		food.setFtype(request.getParameter("ftypeval"));
		food.setFaddr(request.getParameter("faddr"));
		food.setFtel(request.getParameter("ftel"));
		String fcomm = request.getParameter("fcomm").replace("\r\n","<br>");
		food.setFcomm(fcomm);
		
		String ftype = "";
		if(request.getParameter("ftype").equals("all")) {
			ftype = "all";
		} else if (food.getFtype().equals("음식점")) {
			ftype ="rest";
		} else if (food.getFtype().equals("카페")) {
			ftype ="cafe";
		} else if (food.getFtype().equals("기타")) {
			ftype ="etc";
		} 
		
		FoodDAO dao = new FoodDAO();
		int cnt = dao.updateFood(food);
		
		if(cnt>0) {
			response.sendRedirect("/gyeongju/GetFood.do?ftype="+ftype+"&fno="+food.getFno());
		} else {
			response.sendRedirect("/gyeongju/FoodUpdate.do?ftype="+ftype+"&fno="+food.getFno());
		}
	}

}
