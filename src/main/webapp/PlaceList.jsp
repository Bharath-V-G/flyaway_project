<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>    
<%@ page import="web.Search" %>
<%@ page import="util.InItConn" %>

<%

   String query = "SELECT Source FROM flyawaydb.flight UNION  SELECT Destination FROM flyawaydb.flight";

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
if(session.getAttribute("mail")!=null)
{
	//out.println("welcome " +session.getAttribute("name"));
	
	out.println("welcome " +session.getAttribute("mail"));
%>

 </div>
<br>
<div align="right">
<a href="logout">Logout</a>
</div>
 <br>
 <br>
 <div >
            <form method="post" action="${pageContext.request.contextPath}/AdminDashboard.jsp">
                <button type="submit" >Dashboard</button>
            </form>&ensp;
        </div>
<div>
    <h2 align="center"><span><strong>Master List of Places </strong></span></h2>

     <div style="border:3px solid black;width:100S%;border-radius:20px;padding:20px" align="center">
    <table >
        <thead>
        <tr>

        </tr>
        </thead>
        <tbody>
      
        <%
            try{
            	con = new InItConn().getConnection();
                st=con.createStatement();
                resultSet = st.executeQuery(query);
                while(resultSet.next()){
        %>
        
        <tr bgcolor="#F5F5F5">
            <td><%=resultSet.getString("Source") %></td>
      
           
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