package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        
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
            
            // 插入用户信息
            String sql = "INSERT INTO users (username, password, gender) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, gender);
            
            int rowsInserted = statement.executeUpdate();
            
            if (rowsInserted > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('注册成功');");
                out.println("location='login.jsp';"); // 注册成功后重定向到登录页面
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('注册失败，请重试');");
                out.println("location='register.jsp';");
                out.println("</script>");
            }
            
            // 关闭连接
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("数据库连接或插入错误");
        }
    }
}

