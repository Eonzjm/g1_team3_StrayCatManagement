package service;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import dto.Cat;

public class CatModel {
	public ArrayList<Cat> getCats(int curPage, int pageSize){
		ArrayList<Cat> cats = null;
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			cats = new ArrayList<Cat>();
			PreparedStatement st = null;
			ResultSet rs = null;
			try {
				st = con.prepareStatement("select id, catname, introduction, gender, picFile from cat limit ?, ?");
				st.setInt(1, (curPage - 1) * pageSize);
				st.setInt(2, pageSize);
				rs = st.executeQuery();
				while(rs.next()) {
					Cat s = new Cat();
					s.setId(rs.getInt(1));
					s.setCatname(rs.getString(2));
					s.setIntroduction(rs.getString(3));
					s.setGender(rs.getInt(4));
					s.setPicFile(rs.getString(5));
					cats.add(s);
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
		return cats;
	}
	
	public int getCatsQty() {
		int r = -1;  
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			Statement st = null;
			ResultSet rs = null;
			try {
				st = con.createStatement();
				rs = st.executeQuery("select count(*) from cat");
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
	
	public int delCat(int id) {
		int r = -1;  
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			PreparedStatement st = null;
			try {
				st = con.prepareStatement("delete from cat where id=?");
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
	
	public int insertCat(Cat s) {
		int r = -1;  
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			PreparedStatement st = null;
			try {
				if(s.getPicFile()!=null) {
					st = con.prepareStatement("insert into cat (catname, introduction, gender, picFile) values (?,?,?,?)");
					st.setString(1, s.getCatname());
					st.setString(2, s.getIntroduction());
					st.setInt(3, s.getGender());
					st.setString(4, s.getPicFile());
				}
				else {
					st = con.prepareStatement("insert into cat (catname, introduction, gender) values (?,?,?)");
					st.setString(1, s.getCatname());
					st.setString(2, s.getIntroduction());
					st.setInt(3, s.getGender());
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
	public int updateCat(Cat s) {
		int r = -1;  
		Connection con = ConnectionPool.getInstance().getConnection();
		if(con != null) {
			PreparedStatement st = null;
			try {
				if(s.getPicFile()!=null) {
					st = con.prepareStatement("update cat set catname=?, introduction=?, gender=?, picFile=? where id=?");
					st.setString(1, s.getCatname());
					st.setString(2, s.getIntroduction());
					st.setInt(3, s.getGender());
					st.setString(4, s.getPicFile());
					st.setInt(5, s.getId());
				}
				else {
					st = con.prepareStatement("update cat set catname=?, introduction=?, gender=? where id=?");
					st.setString(1, s.getCatname());
					st.setString(2, s.getIntroduction());
					st.setInt(3, s.getGender());
					st.setInt(4, s.getId());
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
