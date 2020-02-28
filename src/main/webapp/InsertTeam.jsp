<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<form action="insertTeamm.jsp" accept="image/gif,image/jpeg"><pre>
	<h2>Add Team details</h2> 
Team name:            <input type="text" name="tname"><br>                                                                                        
Team owner:           <input type="text" name="towner"><br>   
Team coach:           <input type="text" name="tcoach"><br>   
Amount remaining:     <input type="number" name="aremain"><br>   	
		
		                                                                     <input type="submit" value="Submit">
		     
	</pre>
	</form>
</body>
</html>