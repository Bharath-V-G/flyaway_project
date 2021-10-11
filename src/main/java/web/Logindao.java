package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.InItConn;
//import util.InItConn;
public class Logindao {


	String sql = "select * from user where PassWord=? and Email=?";
	public Connection con=null;
	public Statement st=null;
	public boolean check(String password, String email){
		boolean flag =false;
		
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = new InItConn().getConnection();
			
			PreparedStatement st = con.prepareStatement(sql);
			
			
			st.setString(1, password);
			st.setString(2, email);
			
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				flag =true;
				return flag;
			}
			
		
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		
		return flag;
		
	
	
	
}
	
	
}	
