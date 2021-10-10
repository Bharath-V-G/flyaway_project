package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.InItConn;
public class UserRegistrationdao {
	
	
	
//	String url ="jdbc:mysql://localhost:3306/flyawaydb";
//	String username="root";
//	String password="1234";
	String sql = "INSERT INTO user(Name,Email,PassWord) VALUES (?,?,?);";
	public Connection con=null;
	public Statement st=null;
	public boolean check(String name, String email, String pass){
		boolean flag =false;
		
		try {
			
			con = new InItConn().getConnection();
		//	Class.forName("com.mysql.jdbc.Driver");
			//Class.forName("com.mysql.cj.jdbc.Driver");
			//Connection con = DriverManager.getConnection(url,username,password);
			
			PreparedStatement st = con.prepareStatement(sql);
			
			
			st.setString(1,name);
			st.setString(2,email);
			st.setString(3,pass);
			
			
			int rs = st.executeUpdate();
			
			if(rs == 1){
				flag =true;
				return flag;
			}
			
		
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		
		return flag;
		
		
		
		
		
	}
	
	

}
