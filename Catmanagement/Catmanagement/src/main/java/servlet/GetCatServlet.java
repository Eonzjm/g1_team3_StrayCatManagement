package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.StringUtils;

import dto.PageInfo;
import dto.Cat;
import service.CatModel;

/**
 * Servlet implementation class GetCatsServlet1
 */
@WebServlet("/GetCatServlet")
public class GetCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		request.setCharacterEncoding("utf-8");
		CatModel sb = new CatModel();
		ArrayList<Cat> cats;
		String curpage=request.getParameter("curPage");
		String pagesize=request.getParameter("pageSize");
		int curPage = Integer.parseInt(StringUtils.isNullOrEmpty(curpage)?"1":curpage);
		int pageSize = Integer.parseInt(StringUtils.isNullOrEmpty(pagesize)?"10":pagesize);
		cats = sb.getCats(curPage, pageSize);
		PageInfo pi = new PageInfo();
		pi.setPageNum(curPage);
		pi.setPageSize(pageSize);
		pi.setTotalRows(sb.getCatsQty());
		request.setAttribute("cats", cats);
		request.setAttribute("pageInfo", pi);
		request.getRequestDispatcher("catsEditor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
