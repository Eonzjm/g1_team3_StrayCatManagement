package servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(filterName="LoginFilter", urlPatterns= {"/*"})
public class LoginFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession(true);
		String request_uri = req.getRequestURI();
		String ctxPath = req.getContextPath();
		String uri = request_uri.substring(ctxPath.length());
		if(uri.contains("Student"))
			// pass the request along the filter chain
			if(null != session.getAttribute("curUser"))
				chain.doFilter(request, response);
			else {
				HttpServletResponse resp = (HttpServletResponse)response;
				resp.setContentType("text/html;");
				resp.setCharacterEncoding("utf-8");
				resp.getWriter().println("请先登录！ 3秒后转到登录页面。");
				resp.setHeader("refresh", "3;url="+ctxPath + "/login.jsp");
				return;
			}
		else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
