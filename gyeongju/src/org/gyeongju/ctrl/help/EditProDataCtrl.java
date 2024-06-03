package org.gyeongju.ctrl.help;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gyeongju.dao.DataDAO;
import org.gyeongju.dto.Data;

@WebServlet("/EditProData.do")
public class EditProDataCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProDataCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Data data = new Data();
		data.setBno(Integer.parseInt(request.getParameter("bno")));
		data.setTitle(request.getParameter("title"));
		data.setContent(request.getParameter("content"));
		
		DataDAO dao = new DataDAO();
		int cnt = dao.editProData(data);
		
		if(cnt>0) {
			response.sendRedirect("/gyeongju/dataList.do");
		} else {
			response.sendRedirect("/gyeongju/EditData.do?no="+data.getBno());
		}
	}

}
