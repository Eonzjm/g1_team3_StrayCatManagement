package servlet;

import java.io.File;
import java.io.IOException;
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
import java.net.URLDecoder;
import dto.Cat;
import service.CatModel;
/**
 * Servlet implementation class ModiStudentServlet
 */
@WebServlet("/ModiStudentServlet")
@MultipartConfig
public class ModiCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModiCatServlet() {
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
        CatModel sb = new CatModel();
		Cat s = new Cat();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		int objId = Integer.parseInt(request.getParameter("objId"));
		s.setId(objId);
		s.setCatName(URLDecoder.decode(request.getParameter("catname"), "UTF-8"));
		s.setGender(Integer.parseInt(request.getParameter("gender")));
		s.setIntroduction(URLDecoder.decode(request.getParameter("introduction"), "UTF-8"));
		s.setPicFile(null);
		
		Part part = request.getPart("picFile");
		String fileName = part.getHeader("content-disposition");
		String oldName = fileName.substring(fileName.lastIndexOf("=") + 2, fileName.length()-1);
		//String oldName = part.getName();
		if(!oldName.equals("picFile")) {
			s.setPicFile(oldName);
			File uploadFileDir = new File(getServletContext().getRealPath("/picFiles"));
			if(!uploadFileDir.exists()) {
				uploadFileDir.mkdir();
			}
			part.write(uploadFileDir + File.separator + oldName);  //将上传的文件写入预定的目录
		}
		
		if(-1 != sb.updateCat(s)) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/text; charset=UTF-8");
			response.getWriter().print("y");
		}
		else {
			response.getWriter().print("n");
		}
	}

}
