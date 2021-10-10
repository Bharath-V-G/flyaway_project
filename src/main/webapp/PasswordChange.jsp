<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="web.AdminLogin" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Change</title>
</head>
<body>


<div class="container">
       
        <%
	session=request.getSession(false);
if(session.getAttribute("mail")!=null)
{

	out.println("welcome " +session.getAttribute("mail"));

%>

   <div >
            <form method="post" action="${pageContext.request.contextPath}/AdminDashboard.jsp">
                <button type="submit" >Dashboard</button>
            </form>&ensp;
        </div>
<center>
 <h1>Password Change</h1>

        <br>
                <form action="ChangePassword" method="post">
                    <div>
                        <label >Email address : admin@gmail.com</label>
                    </div>
                    <div >
                        <label for="inputPassword" >New Password</label>
                        <input type="password" name="passwordEntered"  placeholder="Enter a new password">
                        
                    </div>
                    <button type="submit">Change Password</button>
                </form>
                </center>
             <%} else
            	{%>
            	<div>
            	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

            	</div>
            <%@ include file= "AdminLogin.jsp" %>
            <%} %>
    </div>

</body>
</html>