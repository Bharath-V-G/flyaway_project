package web;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//import dao.StringUtil;

import util.InItConn;


public class Dao {
	public Connection con=null;
	public Statement st=null;

	public Dao() throws ClassNotFoundException, SQLException{
//		System.out.print("gdhdjhsjsjsjsjsjdb cb");
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","1234");
//		System.out.println("connection established with database");
		con = new InItConn().getConnection();
		st=con.createStatement();
	}


public boolean insertFlight(HashMap<String, String> flight) throws SQLException {
	//PreparedStatement stm=con.prepareStatement("INSERT INTO 'flyaway.flights' ('name', 'from', 'to', 'date', 'time', 'price') values(?,?,?,?,?,?)");
	//String sql="INSERT INTO flights ('name','from','to','date','time','price') values('"+flight.get("name")+"','"+flight.get("from")+"','"+flight.get("to")+"','"+flight.get("date")+"','"+flight.get("time")+"','"+flight.get("price")+"');";
	String query1 = "INSERT INTO flight (FlightId, Name, Source, Destination, Date, TicketPrice) VALUES" + " ('"
			+ StringUtil.fixSqlFieldValue(flight.get("flightid")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("name")) + "'," + " '"
			+ StringUtil.fixSqlFieldValue(flight.get("source")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("destination")) + "'," + " '"
			+ StringUtil.fixSqlFieldValue(flight.get("day")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("price")) + "')";
	
	//String sql="INSERT INTO `flyaway`.`flights` (`name`, `fromf`, `tof`, `datef`, `timef`, `price`) VALUES ('indigo', 'hyd', 'viz', '2021-04-08', '10:00', '2000');";
	System.out.println(flight.get("date"));
	System.out.println(flight.get("time"));
	//String query1="INSERT into flyaway.flights (name,from,to,date,time,price) values('indigo','hyd','viz','24-02-2022','10:30','2000')";
	try {
		//stm.execute();
		st.execute(query1);
		return true;
	} catch (SQLException e) {
		System.out.print("error");
		e.printStackTrace();
	}
	return false;
}

}
