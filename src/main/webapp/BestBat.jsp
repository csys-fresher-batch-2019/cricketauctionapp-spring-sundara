<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.playingeleven.model.Cricketing" %>
  <%@ page import="com.playingeleven.dao.impl.CricketingDAOImpl" %>
     <%@ page import="com.playingeleven.dao.dto.Batting" %>
    <%@ page import="java.util.ArrayList" %>
      <%@ page import="java.util.List" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Batting</title>
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
<h2>view best batsman ranking</h2>
<table><tr>
<th>Player</th>
<th>Player Name</th>
<th>Role Name</th>
<th>Batting</th>
<th>Batting Average</th>
<th>Rank</th><tr>
<%
CricketingDAOImpl impl = new CricketingDAOImpl();
impl.bestBowlingAverage();
ArrayList<Batting> BattingAverage = impl.bestBattingAverage();
for (Batting batting : BattingAverage) {
	%>	<tr>
	<td><img src="assets/images/<%=batting.getPlayerImage()%>" height='196px' width='160px' ></img></td>
			<td><%=batting.getPlayerFullName() %></td>
			<td><%=batting.getRoleName() %></td>
			<td><%=batting.getBatting() %></td>
			<td><%=batting.getBattingAverage() %></td>
			<td><%=batting.getRank() %></td>
	</tr>
		<%} %>

</table>

</body>
</html>