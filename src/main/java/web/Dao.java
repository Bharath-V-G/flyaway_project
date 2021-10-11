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

		con = new InItConn().getConnection();
		st=con.createStatement();
	}


public boolean insertFlight(HashMap<String, String> flight) throws SQLException {
	String query1 = "INSERT INTO flight (FlightId, Name, Source, Destination, Date, TicketPrice) VALUES" + " ('"
			+ StringUtil.fixSqlFieldValue(flight.get("flightid")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("name")) + "'," + " '"
			+ StringUtil.fixSqlFieldValue(flight.get("source")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("destination")) + "'," + " '"
			+ StringUtil.fixSqlFieldValue(flight.get("day")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("price")) + "')";
	
	System.out.println(flight.get("date"));
	System.out.println(flight.get("time"));
	try {
		st.execute(query1);
		return true;
	} catch (SQLException e) {
		System.out.print("error");
		e.printStackTrace();
	}
	return false;
}
public boolean deleteFlight(HashMap<String, String> flight) throws SQLException {
	String query1 = "DELETE FROM flight where FlightId = '"+flight.get("flightid")+"'";
	
		try {
		if(st.executeUpdate(query1)>0)
		return true;
	} catch (SQLException e) {
		System.out.print("error");
		e.printStackTrace();
	}
	return false;
}


}
