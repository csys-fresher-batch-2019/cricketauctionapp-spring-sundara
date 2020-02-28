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
   	<form action="TeamPlayerr.jsp" accept="image/gif,image/jpeg"><pre>
	<h2>Team Players details</h2>
   <label for="tname">Choose a team to view:</label>

<select name="tname">
  <option value="CSK">CSK</option>
  <option value="MI">MI</option>
  <option value="RCB">RCB</option>
  <option value="SRH">SRH</option>
   <option value="KKR">KKR</option>
</select>
  	
		
		                                                                     <input type="submit" value="Submit">
		     
	</pre>
	</form>

</body>
</html>