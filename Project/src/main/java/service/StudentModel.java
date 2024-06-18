package service;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import dto.Student;

public class StudentModel {
	public ArrayList<Student> getStudents(int curPage, int pageSize){
		ArrayList<Student> students = null;
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			students = new ArrayList<Student>();
			PreparedStatement st = null;
			ResultSet rs = null;
			try {
				st = con.prepareStatement("select id, studentId, citizenId, name, dormitory, gender, enrollDate, picFile from student limit ?, ?");
				st.setInt(1, (curPage - 1) * pageSize);
				st.setInt(2, pageSize);
				rs = st.executeQuery();
				while(rs.next()) {
					Student s = new Student();
					s.setId(rs.getInt(1));
					s.setStudentId(rs.getString(2));
					s.setCitizenId(rs.getString(3));
					s.setName(rs.getString(4));
					s.setDormitory(rs.getString(5));
					s.setGender(rs.getInt(6));
					s.setEnrollDate(rs.getDate(7));
					s.setPicFile(rs.getString(8));
					students.add(s);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(st != null) st.close();
					ConnectionPool.getInstance().returnConnection(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return students;
	}
	
	public int getStudentsQty() {
		int r = -1;  //如果返回-1，表示没有获得连接，应该稍后再试。
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			Statement st = null;
			ResultSet rs = null;
			try {
				st = con.createStatement();
				rs = st.executeQuery("select count(*) from student");
				if(rs.next()) {
					r = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(st != null) st.close();
					ConnectionPool.getInstance().returnConnection(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return r;
	}
	//第11次课新增：根据学生记录id删除学生
	public int delStudent(int id) {
		int r = -1;  //如果返回-1，表示没有获得连接，应该稍后再试。
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			PreparedStatement st = null;
			try {
				st = con.prepareStatement("delete from student where id=?");
				st.setInt(1, id);
				r = st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(st != null) st.close();
					ConnectionPool.getInstance().returnConnection(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return r;
	}
	//第12次课新增
	public int insertStudent(Student s) {
		int r = -1;  //如果返回-1，表示没有获得连接，应该稍后再试。
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			PreparedStatement st = null;
			try {
				if(s.getPicFile()!=null) {
					st = con.prepareStatement("insert into student (studentId, citizenId, name, dormitory, gender, enrollDate,picFile) values (?,?,?,?,?,?,?)");
					st.setString(1, s.getStudentId());
					st.setString(2, s.getCitizenId());
					st.setString(3, s.getName());
					st.setString(4, s.getDormitory());
					st.setInt(5, s.getGender());
					st.setDate(6, new Date(s.getEnrollDate().getTime()));
					st.setString(7, s.getPicFile());
				}
				else {
					st = con.prepareStatement("insert into student (studentId, citizenId, name, dormitory, gender, enrollDate) values (?,?,?,?,?,?)");
					st.setString(1, s.getStudentId());
					st.setString(2, s.getCitizenId());
					st.setString(3, s.getName());
					st.setString(4, s.getDormitory());
					st.setInt(5, s.getGender());
					st.setDate(6, new Date(s.getEnrollDate().getTime()));
				}
				r = st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(st != null) st.close();
					ConnectionPool.getInstance().returnConnection(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return r;
	}
	public int updateStudent(Student s) {
		int r = -1;  //如果返回-1，表示没有获得连接，应该稍后再试。
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			PreparedStatement st = null;
			try {
				if(s.getPicFile()!=null) {
					st = con.prepareStatement("update student set studentId=?, citizenId=?, name=?, dormitory=?, gender=?, enrollDate=?, picFile=? where id=?");
					st.setString(1, s.getStudentId());
					st.setString(2, s.getCitizenId());
					st.setString(3, s.getName());
					st.setString(4, s.getDormitory());
					st.setInt(5, s.getGender());
					st.setDate(6, new Date(s.getEnrollDate().getTime()));
					st.setString(7, s.getPicFile());
					st.setInt(8, s.getId());
				}
				else {
					st = con.prepareStatement("update student set studentId=?, citizenId=?, name=?, dormitory=?, gender=?, enrollDate=? where id=?");
					st.setString(1, s.getStudentId());
					st.setString(2, s.getCitizenId());
					st.setString(3, s.getName());
					st.setString(4, s.getDormitory());
					st.setInt(5, s.getGender());
					st.setDate(6, new Date(s.getEnrollDate().getTime()));
					st.setInt(7, s.getId());
				}
				r = st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(st != null) st.close();
					ConnectionPool.getInstance().returnConnection(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return r;
	}

}
