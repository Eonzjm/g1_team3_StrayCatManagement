package servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException; 
import java.text.SimpleDateFormat; 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dto.Student;
import service.StudentModel;
/**
 * Servlet implementation class NewStudentServlet
 */
@WebServlet("/NewStudentServlet")
@MultipartConfig
public class NewStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		request.setCharacterEncoding("utf-8");
		StudentModel sb = new StudentModel();
		Student s = new Student();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		s.setCitizenId(request.getParameter("citizenId"));
		s.setStudentId(request.getParameter("studentId"));
		s.setName(URLDecoder.decode(request.getParameter("name"), "UTF-8"));
		s.setGender(Integer.parseInt(request.getParameter("gender")));
		s.setDormitory(URLDecoder.decode(request.getParameter("dormitory"), "UTF-8"));
		try {
			s.setEnrollDate(df.parse(request.getParameter("enrollDate")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Part part = request.getPart("picFile");
		String fileName = part.getHeader("content-disposition");
		String oldName = fileName.substring(fileName.lastIndexOf("=") + 2, fileName.length()-1);
		s.setPicFile(null);
		if(!oldName.equals("picFile")) {
			s.setPicFile(oldName);
			File uploadFileDir = new File(getServletContext().getRealPath("/picFiles"));
			if(!uploadFileDir.exists()) {
				uploadFileDir.mkdir();
			}
			part.write(uploadFileDir + File.separator + oldName);  //将上传的文件写入预定的目录
		}
		
		if(-1 != sb.insertStudent(s)) {
			response.getWriter().print("y");
		}
		else {
			response.getWriter().print("n");
		}
	}

}
