package org.gyeongju.ctrl.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gyeongju.dao.MemberDAO;
import org.gyeongju.dto.Member;
import org.gyeongju.util.AES256;



@WebServlet("/LoginPro.do")
public class LoginProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginProCtrl() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		MemberDAO dao = new MemberDAO();
		Member member = dao.getMember(id);
		
		HttpSession session = request.getSession();
		RequestDispatcher view;
		
		String key = "%02x";
		
		try {
			member.setPw(AES256.decryptAES256(member.getPw(), key));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(session.getAttribute("sid") != null) {
			response.sendRedirect("/gyeongju");
		}
		
		if(id.equals(member.getId()) && pw.equals(member.getPw())) {
			session.setAttribute("sid", member.getId());
			response.sendRedirect("/gyeongju");
		} else if(id.equals(member.getId())) {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			view = request.getRequestDispatcher("/member/login.jsp");
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "회원이 존재하지 않습니다.");
			view = request.getRequestDispatcher("/member/login.jsp");
			view.forward(request, response);
		}
	}

}
