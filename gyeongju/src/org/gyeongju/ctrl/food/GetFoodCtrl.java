package org.gyeongju.ctrl.food;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gyeongju.dao.FoodDAO;
import org.gyeongju.dto.Food;

@WebServlet("/GetFood.do")
public class GetFoodCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public GetFoodCtrl() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ftype = request.getParameter("ftype");
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FoodDAO dao = new FoodDAO();
		Food food = dao.getFood(fno);
		
		request.setAttribute("ftype", ftype);
		request.setAttribute("food", food);
		RequestDispatcher view = request.getRequestDispatcher("/food/getFood.jsp");
		view.forward(request, response);
	}

}
