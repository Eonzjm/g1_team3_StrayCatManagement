package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 数据库连接信息
        String jdbcURL = "jdbc:mysql://localhost:3306/CatManagement";
        String jdbcUsername = "root";
        String jdbcPassword = "214603103267";
        
        try {
            // 加载 JDBC 驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 建立数据库连接
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            
            // 查询用户信息
            String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND userType = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, userType);
            
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                // 登录成功，设置 session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userType", userType);
                
                if ("admin".equals(userType)) {
                    response.sendRedirect("adminDashboard.jsp"); // 重定向到管理员页面
                } else {
                    response.sendRedirect("userDashboard.jsp"); // 重定向到用户页面
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('用户名或密码错误');");
                out.println("location='initial.jsp';");
                out.println("</script>");
            }
            
            // 关闭连接
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("数据库连接或查询错误");
        }
    }
}

