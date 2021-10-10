<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>





<center>

 <h1> Welcome to FlyAway</h1>

<h2>Admin Login</h2>
<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action=AdminLogin method=post>
	<label for=email>Email :-</label> <input type="email" name=email id=email /><br><br>
	<label for=pass>Password :-</label> <input type="password" name=pass id=pass /><br><br>
	<input type=submit value=Login /> <input type=reset />
</form>
</div>
</center><br>







</body>
</html>