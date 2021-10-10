package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import util.InItConn;

public class ChangePasswordAdmindao {
//	String url ="jdbc:mysql://localhost:3306/flyawaydb";
//	String username="root";
//	String password="1234";
	String sql = "Update AdminLogin set PassWord=? Where Email=?;";
	public Connection con=null;
	public Statement st=null;
	public boolean check(String pass){
		boolean flag =false;
		
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver");
			con = new InItConn().getConnection();
			//Connection con = DriverManager.getConnection(url,username,password);
			
			PreparedStatement st = con.prepareStatement(sql);
			
			
			st.setString(1,pass);
			st.setString(2,"Admin@gmail.com");
			
			
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
