package org.gyeongju.ctrl.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gyeongju.dao.MemberDAO;
import org.gyeongju.dto.Member;
import org.gyeongju.util.AES256;


@WebServlet("/JoinPro.do")
public class JoinProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public JoinProCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String pw = request.getParameter("password");
		String key = "%02x";
		String enPw = "";
		
		try {
            enPw = AES256.encryptAES256(pw, key);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPw(enPw);
		member.setEmail(request.getParameter("email"));
		member.setTel(request.getParameter("tel"));
		member.setPostcode(request.getParameter("postcode"));
		member.setAddress(request.getParameter("address1")+"$"+request.getParameter("address2"));
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(member);
		
		if(cnt>0) {
			response.sendRedirect(request.getContextPath());
		} else {
			response.sendRedirect("/Join.do");
		}
	}

}
