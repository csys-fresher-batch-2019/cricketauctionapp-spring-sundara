<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find role</title>
</head>
<style>
body {
    background-color: #aaa;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
body {font-family: Arial, Helvetica, sans-serif;}
</style>
<body>
 	<form action="FindRolee.jsp" accept="image/gif,image/jpeg"><pre>
	<h2>Find Player by Role</h2>
	<p>Enter role to find player</p>
<select name="rname">
  <option value="batsman">batsman</option>
  <option value="bowler">bowler</option>
  <option value="all-rounder">all-rounder</option>
  <option value="wicketkeeper/batsman">wicketkeeper/batsman</option>
</select>
  	<input type="submit" value="Submit"/>
		     
	
  </pre>
  </form>
  </body>
  </html>