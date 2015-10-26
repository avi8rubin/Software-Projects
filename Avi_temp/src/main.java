import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import com.mysql.jdbc.Statement;


/////////////avi//////////////////////////////////////////
public class main {
	static Connection conn = null;
	static Statement st = null;
	
	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://sql2.freemysqlhosting.net:3306/sql294276", "sql294276", "eC5*iI4%");
			
		} catch (SQLException e) {
			System.err.println("Connection to Database failed:"+e.getMessage());
			e.printStackTrace();
		}
		
		try {
			st =  conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "SELECT firstName, lastName FROM Users"; 
		ResultSet resultSet = null;
		try {
			resultSet = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		try {
			while (resultSet.next()) {
			System.out.println(resultSet.getString(1) + ":" + 
			resultSet.getString("lastName") ); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		}

	}
	

