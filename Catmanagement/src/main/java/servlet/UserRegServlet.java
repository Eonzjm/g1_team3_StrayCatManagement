package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dto.UserReg;
import service.UserModel;

/**
 * Servlet implementation class UserRegServlet
 */
@WebServlet("/UserRegServlet")
public class UserRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegServlet() {
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
		String username = request.getParameter("username").trim();
		String pwd = request.getParameter("pwd").trim();
		
		String email = request.getParameter("email").trim();
		
		UserReg user = new UserReg();
		user.setUsername(username);
		user.setPwd(pwd);
		
		user.setEmail(email);
		UserModel uc = new UserModel();
		if(1 == uc.addUser(user)) {
			   HttpSession session = request.getSession(true);
			   session.setAttribute("curUser", username);
			   RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			   dis.forward(request, response);
		} else {
			request.setAttribute("currUser", user);
			request.setAttribute("postError", "提交不成功，请再次尝试！");
			RequestDispatcher dis = request.getRequestDispatcher("userReg.jsp");
			dis.forward(request, response);
			//response.sendRedirect(response.encodeRedirectURL("userReg.jsp"));
		}
	}

}
