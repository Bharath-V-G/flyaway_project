<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<%@page import="web.AdminLogin"%>
<%@ page import="util.InItConn" %>

<%
   // String driverName = "com.mysql.jdbc.Driver";
   // String connectionUrl = "jdbc:mysql://localhost:3306/";
   // String dbName = "flyawaydb";
    //String userId = "root";
   // String password = "root";

   // try {
  //      Class.forName(driverName);
   // } catch (ClassNotFoundException e) {
   //     e.printStackTrace();
   // }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
<%
	session=request.getSession(false);
if(session.getAttribute("mail")!=null)
{

	out.println("welcome " +session.getAttribute("mail"));
%>
<div align="right">
<a href="logout">Logout</a>
  </div>
<div align="center"><h1>Admin Dashboard</h1>
</div>

<div class="row">
        <div >
            <form method="post" action="${pageContext.request.contextPath}/PasswordChange.jsp">
                <button type="submit" >Change Password</button>
            </form>&ensp;
        </div>
          <div >
            <form method="post" action="${pageContext.request.contextPath}/AdminHome.jsp">
                <button type="submit" >Add flight</button>
            </form>&ensp;
        </div>
       
       <br>

</div>

            <div align="center"><h2> Flight Table</h2>
</div>
<div style="border:3px solid black;width:100S%;border-radius:20px;padding:20px" align="center">
<center>
<section >
    <section >
        <section>
            <table >
                <thead>
                <tr>
                    <th scope="col">Flight ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Source</th>
                    <th scope="col">Destination</th>
                    <th scope="col">Date</th>
                    <th scope="col">Ticket Price</th>
                </tr>
                </thead>
                <tbody>
   
                <%
                    try{
                    	connection = new InItConn().getConnection();
                        //connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                        statement=connection.createStatement();
                        String sql ="SELECT * FROM flight";
                        resultSet = statement.executeQuery(sql);
                        while(resultSet.next()){
                %>
                <tr>
                    <td><%=resultSet.getString("FlightId") %></td>
                    <td><%=resultSet.getString("Name") %></td>
                    <td><%=resultSet.getString("Source") %></td>
                    <td><%=resultSet.getString("Destination") %></td>
                    <td><%=resultSet.getString("Date") %></td>
                    <td><%=resultSet.getString("TicketPrice") %></td>
                </tr>
                
                
                <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }%>
                <%} else
            	{%>
            	<div>
            	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

            	</div>
            <%@ include file= "AdminLogin.jsp" %>
            <%} %>
                
              
                </tbody>
            </table>
        </section>
    </section>
</section>
</center>

</div>

</body>
</html>