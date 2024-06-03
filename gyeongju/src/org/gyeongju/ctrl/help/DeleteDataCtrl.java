package org.gyeongju.ctrl.help;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.DataDAO;

@WebServlet("/DeleteData.do")
public class DeleteDataCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteDataCtrl() {
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
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		DataDAO dao = new DataDAO();
		
		String filename = dao.getData(bno).getFilename();
		String filepath = request.getServletContext().getRealPath("/upload/data/")+filename;
		File delFile = new File(filepath);
		delFile.delete();
		
		int cnt = dao.delData(bno);
		
		if(cnt>0) {
			response.sendRedirect("/gyeongju/DataList.do");
		} else {
			response.sendRedirect("/gyeongju/GetData2.do?no="+bno);
		}
	}

}
