<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>    
<%@ page import="web.Search" %>
<%@ page import="util.InItConn" %>

<%
   // String driverName = "com.mysql.jdbc.Driver";
    //String connectionUrl = "jdbc:mysql://localhost:3306/";
    //String dbName = "flyawaydb";
    //String userId = "root";
    //String password = "1234";
   String query = Search.getQuery();
   // try {
     //   Class.forName(driverName);
    //} catch (ClassNotFoundException e) {
      //  e.printStackTrace();
    //}
    Connection con = null;
    Statement st = null;
    ResultSet resultSet = null;
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Flyaway Flights</title>
</head>
<body>
<div>
<%
	session=request.getSession(false);
if(session.getAttribute("email")!=null)
{
	//out.println("welcome " +session.getAttribute("name"));
	
	out.println("welcome " +session.getAttribute("email"));
%>

 </div>
<br>
<div align="right">
<a href="logout">Logout</a>
</div>
 <br>
 <br>

<div>
    <h2 align="center"><span><strong>Flight list </strong></span></h2>
    <p align="center"><span><strong>
        You Searched flights from <%=Search.source%> to  <%=Search.destination%> <br>
        Date of travel : <%=Search.date%> (<%=Search.day%>)  <br>
        No of travelers :  <%=Search.persons%>  <br>
    </p>
     <div style="border:3px solid black;width:100S%;border-radius:20px;padding:20px" align="center">
    <table >
        <thead>
        <tr>
            <th scope="col">Flight</th>
            <th scope="col">Source</th>
            <th scope="col">Destination</th>
            <th scope="col">Date</th>
            <th scope="col">Ticket Price(Rs)</th>
            <th scope="col">Select</th>
        </tr>
        </thead>
        <tbody>
        <p align="center"><span><strong><h2>Select a flight</h2></strong></span></p>
        <%
            try{
            	con = new InItConn().getConnection();
                st=con.createStatement();
                resultSet = st.executeQuery(query);
                while(resultSet.next()){
        %>
        
        <tr bgcolor="#F5F5F5">
            <td><%=resultSet.getString("Name") %></td>
            <td><%=resultSet.getString("Source") %></td>
            <td><%=resultSet.getString("Destination") %></td>
            <td><%=Search.date%></td>
            <td><%=resultSet.getString("TicketPrice") %></td>
            <td>
                <form action="${pageContext.request.contextPath}/BookFlight.jsp" method="post">
                    <input type="hidden" id="name" name="name" value="<%=resultSet.getString("Name")%>">
                    <input type="hidden" id="ticket_price" name="ticket_price" value="<%=resultSet.getString("TicketPrice")%>">
                    <input type="hidden" id="flight_id" name="flight_id" value="<%=resultSet.getString("FlightId")%>">
                    <input type="submit" class="btn btn-success" value="Book This Flight">
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</div>
</div>
<%} else
	{%>
	<div>
	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

	</div>
<%@ include file= "ULogin.jsp" %>
<%} %>
</body>
</html>