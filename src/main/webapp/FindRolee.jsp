<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.playingeleven.model.Players" %>   
  <%@ page import="com.playingeleven.dao.impl.PlayersDAOImpl"%>  
    <%@ page import="java.util.ArrayList" %>
      <%@ page import="java.util.List" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>find role</title>
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
<h2>Show players role name</h2>
<table><tr>
<th>Player</th>
<th>Player Id</th>
<th>Player name</th>
</tr>
<%
String roleName = request.getParameter("rname");
Players ob = new Players();
ob.setRoleName(roleName);
PlayersDAOImpl impl = new PlayersDAOImpl();
List<Players> list = new ArrayList<Players>();
list = impl.listRoleOfPlayers(roleName);
for (Players players : list) {
	%>	<tr><td><img src="assets/images/<%=players.getPlayerImage()%>" height='196px' width='160px' ></img></td>
	<td><%=players.getPlayerId() %></td>
	<td><%=players.getPlayerFullName() %></td>
	
</tr>
<%} %>

</table>
</body>
</html>