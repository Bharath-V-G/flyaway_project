<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body >

<%
	session=request.getSession(false);
if(session.getAttribute("mail")!=null)
{

	out.println("welcome " +session.getAttribute("mail"));
%>

<br>
<a style="color:black;text-decoration:none ;font-size:35px;font-weight:bold;">FlyAway</a>
<br><br>
   <div >
            <form method="post" action="${pageContext.request.contextPath}/AdminDashboard.jsp">
                <button type="submit" >Dashboard</button>
            </form>&ensp;
        </div>
<center>
<h1>Insert New Flight Details</h1>

<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action=InsertFlight method=post>
	<label for=flightid>Flight ID :-</label> <input type="text" name=flightid id=flightid /><br><br>
	<label for=name>Name :-</label> <input type="text" name=name id=name /><br><br>
	<label for=source>Source :-</label> <input type="text" name=source id=source /><br><br>
	<label for=destination>Destination :-</label> <input type="text" name=destination id=destination /><br><br>
	<label for=day>Date :-</label> <input type="text" name=day id=day /><br><br>
	<label for=price>Ticket Price :-</label> <input type="text" name=price id=price /><br><br>
	<input type=submit value=submit /> <input type=reset />
</form>
</div>
</center>
<%
	String message=(String)session.getAttribute("message");
	if(message!=null){
%>
<p style="color:blue;"><%=message %></p>
<%
		session.setAttribute("message", null);
	}
%>
 <%} else
            	{%>
            	<div>
            	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

            	</div>
            <%@ include file= "AdminLogin.jsp" %>
            <%} %>
                
</body>
</html>