package org.gyeongju.ctrl.help;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/dataDownload.do")
public class dataDownloadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public dataDownloadCtrl() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filename = request.getParameter("filename");

		ServletContext application = request.getServletContext();
		String saveDirectory = application.getRealPath("/upload/data/");

		
		File file = new File(saveDirectory + filename);
		long length = file.length();

		response.setContentType("application/octet-stream");

		response.setContentLengthLong(length);
		filename = new String(filename.getBytes("UTF-8"), "8859_1");
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);

		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

		int data;
		while((data=bis.read()) != -1){
			bos.write(data);
			bos.flush();
		}

		bis.close();
		bos.close();
	}


}
