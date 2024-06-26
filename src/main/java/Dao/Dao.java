package Dao;
import java.sql.Connection;
import java.sql.DriverManager;
public class Dao {
	private static Connection connection=null;
	
	public static Connection getConnection() throws Exception{
		if(connection==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Proje","root","123321@@");
			System.out.println("connected");
		}
		return connection;
	}
}
