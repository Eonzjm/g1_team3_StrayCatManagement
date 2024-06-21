package service;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import com.mysql.cj.jdbc.Driver;

public class ConnectionPool {
	private List<Connection> cons;
	private int connectCount = 5;  
	private ConnectionPool() {
		cons = new ArrayList<Connection>();
		try {
			//Class.forName("com.mysql.cj.jdbc.Driver");
			DriverManager.registerDriver(new Driver());
			cons.add(DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=utf-8", "root", "214603103267"));
			cons.add(DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=utf-8", "root", "214603103267"));
			cons.add(DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=utf-8", "root", "214603103267"));
			cons.add(DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=utf-8", "root", "214603103267"));
			cons.add(DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=utf-8", "root", "214603103267"));
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	private static ConnectionPool instance = new ConnectionPool();
	public static ConnectionPool getInstance() {
		return instance;
	}
    public synchronized Connection getConnection() {
    	if(cons.size()>0) {
//    		Connection c = cons.get(0);
//    		cons.remove(0);
    		return cons.remove(0);
    	}
    	else if(connectCount<10) {   
    		Connection con = null;
    		try {
    			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=utf-8", "root", "214603103267");
    			connectCount ++;
    		} catch (Exception x) {
    			x.printStackTrace();
    		}
    		return con;
    	}
    	else {
    		return null;
    	}
    }
    public synchronized void returnConnection(Connection con) {
    	cons.add(con);
    }
}
