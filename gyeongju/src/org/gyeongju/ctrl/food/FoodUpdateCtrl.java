package org.gyeongju.ctrl.food;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.FoodDAO;
import org.gyeongju.dto.Food;

@WebServlet("/FoodUpdate.do")
public class FoodUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodUpdateCtrl() {
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
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FoodDAO dao = new FoodDAO();
		Food food = dao.getFood(fno);
		String contents = food.getFcomm().replace("<br>", "\r\n");
		food.setFcomm(contents);
		String ftypeOp = food.getFtype();
		String ftype = request.getParameter("ftype");
		
		request.setAttribute("food", food);
		request.setAttribute("ftypeOp", ftypeOp);
		request.setAttribute("ftype", ftype);
		
		RequestDispatcher view = request.getRequestDispatcher("/food/editFood.jsp");
		view.forward(request, response);
	}

}
