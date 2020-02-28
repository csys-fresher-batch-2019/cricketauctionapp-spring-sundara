<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert player</title>
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
	<form action="InsertPlayerr.jsp" accept="image/gif,image/jpeg"><pre>
		<b>BIO details</b><br>                                                                                                           <b>Career details</b><br> 
Full name:            <input type="text" name="fname" placeholder="Enter Full name"><br>                                                                                         Matches:              <input type="number" name="match"placeholder="Enter Matches" min="0"><br>
Date of birth:        <input type="date" name="dob" min="1975-01-01" max="2004-01-01"><br>                                                                                         Innings:              <input type="number" name="inn" placeholder="Enter Innings" min="0"><br> 
Nick name:            <input type="text" name="nname" placeholder="Enter Nick name" ><br>                                                                                         Not outs:             <input type="number" name="nouts" placeholder="Not outs" min="0"><br> 
Role name:            <input type="text" name="rname" placeholder="Enter Role name"><br>
Basic price:          <input type="number" name="bprice"placeholder="Enter Basic Price" min="1000000"><br>
image(jpg/jpeg only): <input type="file" name="pic" accept="image/jpg,image/jpeg"><br>                                                                                         runs scored:          <input type="number" name="rscore" placeholder="Enter Runs Scored" min="0"><br> 
		<b>Cricketing details</b><br>                                                                                         balls bowled:         <input type="number" name="bbowl" placeholder="Enter Balls Bowled" min="0"><br> 
Jersey no:            <input type="number" name="jno" placeholder="Enter Jersey Number" min="0"><br>                                                                                         runs conceded:        <input type="number" name="rcon" placeholder="Enter runs conceded" min="0"><br> 
Batting:              <input type="radio" name="bat" value="right-hand">right-hand                                                      wickets:              <input type="number" name="wicket" placeholder="Enter wickets" min="0"><br> 
		      <input type="radio" name="bat" value="left-hand">left-hand<br><br/>                                                                                         stumpings:            <input type="number" name="stump" placeholder="Enter Stumpings" min="0"><br> 
Bowling:              <input type="radio" name="bowl" value="right-hand">right-hand                                                      catches:              <input type="number" name="catch"placeholder="Enter Catches" min="0"><br> 
		      <input type="radio" name="bowl" value="left-hand">left-hand<br> 
		      <input type="radio" name="bowl" value="nil">nil<br>                                                                                                            <b>Country details</b><br>
Bowling speed:        <input type="radio" name="speed" value="slow">slow                                                            Country name:         <input type="text" name="cname" placeholder="Enter Country name"><br> 
		      <input type="radio" name="speed" value="medium">medium<br>                                                                                         Player type:          <input type="radio" name="play" value="indian">indian   
		      <input type="radio" name="speed" value="fast">fast<br>  
		      <input type="radio" name="speed" value="nil">nil<br>                                                                                                               <input type="radio" name="play" value="overseas">overseas<br>  
		
		
		                                                                     <input type="submit" value="Submit">
		     
	</pre>
	</form>
</body>
</html>