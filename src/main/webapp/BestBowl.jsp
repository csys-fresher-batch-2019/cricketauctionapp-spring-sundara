<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ page import="com.playingeleven.model.Cricketing" %>
  <%@ page import="com.playingeleven.dao.impl.CricketingDAOImpl" %>
     <%@ page import="com.playingeleven.dao.dto.Bowling" %>
  <%@ page import="java.util.ArrayList" %>
      <%@ page import="java.util.List" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Bowling</title>
</head>
<style>
body {
    background-color: #aaa;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
body {font-family: Arial, Helvetica, sans-serif;}
table {
  width: 100%;
}

th {
  height: 50px;
}
th, td {
  padding: 15px;
  text-align: left;
}
</style>
<body>
<h2>view best bowler ranking</h2>
<table><tr>
<th>Player</th>
<th>Player Name</th>
<th>Role Name</th>
<th>Bowling</th>
<th>Bowling Average</th>
<th>Rank</th><tr>
<%
CricketingDAOImpl impl = new CricketingDAOImpl();
impl.bestBowlingAverage();
ArrayList<Bowling> BowlingAverage = impl.bestBowlingAverage();
for (Bowling bowling : BowlingAverage) {
	%><tr><td><img src="assets/images/<%=bowling.getPlayerImage()%>" height='196px' width='160px' ></img></td>
	<td><%=bowling.getPlayerFullName() %></td>
	<td><%=bowling.getRoleName() %></td>
	<td><%=bowling.getBowling() %></td>
	<td><%=bowling.getBowlingAverage() %></td>
	<td><%=bowling.getRank() %></td>
</tr>
<%} %>

</table>

</body>
</html>