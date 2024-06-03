package org.gyeongju.ctrl.food;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gyeongju.dao.FoodDAO;
import org.gyeongju.dto.Food;

@WebServlet("/FoodList.do")
public class FoodListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodListCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ftype = request.getParameter("ftype");
		int curPage = 0;
		if (request.getParameter("page") == null ) {
			curPage = 1;
		} else {
			curPage = Integer.parseInt(request.getParameter("page"));
		}
		
		FoodDAO dao = new FoodDAO();
		List<Food> foodList = new ArrayList<>();
		
		int pcnt = dao.cntPage(ftype);
		
		if (ftype.equals("all")) {
			foodList = dao.getFoodList(curPage);
		} else if (ftype.equals("rest")) {
			foodList = dao.getRestList(curPage);
		} else if (ftype.equals("cafe")) {
			foodList = dao.getCafeList(curPage);
		} else if (ftype.equals("etc")) {
			foodList = dao.getEtcList(curPage);
		} else {
		}
		request.setAttribute("foodList", foodList);
		request.setAttribute("ftype", ftype);
		request.setAttribute("pcnt", pcnt);
		request.setAttribute("curPage", curPage);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/food/foodList.jsp");
		view.forward(request, response);
	}

}
