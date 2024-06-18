package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.PageInfo;
import dto.Student;
import service.StudentModel;

/**
 * Servlet implementation class GetStudentsServlet1
 */
@WebServlet("/GetStudentsServlet")
public class GetStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		request.setCharacterEncoding("utf-8");
		StudentModel sb = new StudentModel();
		ArrayList<Student> students;
		int curPage = Integer.parseInt(request.getParameter("curPage"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		students = sb.getStudents(curPage, pageSize);
		PageInfo pi = new PageInfo();
		pi.setPageNum(curPage);
		pi.setPageSize(pageSize);
		pi.setTotalRows(sb.getStudentsQty());
		request.setAttribute("students", students);
		request.setAttribute("pageInfo", pi);
		RequestDispatcher dis = request.getRequestDispatcher("studentsEditor.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
