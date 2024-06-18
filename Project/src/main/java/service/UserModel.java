package service;

import com.mysql.cj.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import dto.User;
import dto.UserReg;

public class UserModel {
	public boolean validate(User user) {
		boolean r = false;
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		if(user != null) {
			try {
				//Class.forName("com.mysql.cj.jdbc.Driver");
				//DriverManager.registerDriver(new Driver());
				//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentMgr?characterEncoding=utf-8", "root", "Zhbit123#@!");
				con = ConnectionPool.getInstance().getConnection();
				st = con.prepareStatement("select pwd from user where name=?");
				st.setString(1, user.getName());
				rs = st.executeQuery();
				if(rs.next()) {
					String org = rs.getString(1);
					if(org.equals(user.getPwd()))
						r = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(st != null) st.close();
					if(con != null) ConnectionPool.getInstance().returnConnection(con);     //com.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return r;
	}
	public int addUser(UserReg user) {
		int r = 0;
		Connection con = null;
		PreparedStatement st = null;
		if(user != null) {
			try {
				con = ConnectionPool.getInstance().getConnection();
				st = con.prepareStatement("insert into user (name, pwd, phone, email) values (?,?,?,?)");
				st.setString(1, user.getName());
				st.setString(2, user.getPwd());
				st.setString(3, user.getPhone());
				st.setString(4, user.getEmail());
				r = st.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(st != null) st.close();
					if(con != null) ConnectionPool.getInstance().returnConnection(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return r;
	}
	public UserReg getUserByName(String uname) {
		UserReg result = null;
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		if(uname != null) {
			try {
				con = ConnectionPool.getInstance().getConnection();
				st = con.prepareStatement("select name, pwd, phone, email from user where name=?");
				st.setString(1, uname);
				rs = st.executeQuery();
				if(rs.next()) {
					result = new UserReg();
					result.setName(uname);
					result.setPwd(rs.getString(2));
					result.setPhone(rs.getString(3));
					result.setEmail(rs.getString(4));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(st != null) st.close();
					if(con != null) ConnectionPool.getInstance().returnConnection(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}
