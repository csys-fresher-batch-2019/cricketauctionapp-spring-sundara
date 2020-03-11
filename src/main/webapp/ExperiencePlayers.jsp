<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@ page import="com.chainsys.cricketauctionapp.model.Players" %>   
   <%@ page import="com.chainsys.cricketauctionapp.dao.impl.PlayersDAOImpl"%>  
    <%@ page import="java.util.ArrayList" %>
     <%@ page import="java.util.List" %>
      <%@ page import="com.chainsys.cricketauctionapp.dao.dto.Experience" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Experience player</title>
<style>
body {
    background-color: #aaa;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
body {font-family: Arial, Helvetica, sans-serif;}
th, td {
  padding: 15px;
  text-align: left;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<h2>players</h2>
<table><tr>
<th>player</th>
<th>Player Name</th>
<th>Role Name
<th>Matches</th>
<th>Player Id</th>
</tr>
<%
PlayersDAOImpl impl = new PlayersDAOImpl();
impl.listOfExperiencedPlayers();
ArrayList<Experience> ExperiencePlayers = impl.listOfExperiencedPlayers();
%>
<c:set var="a" value="<%=ExperiencePlayers%>"></c:set>
			<c:forEach items="${a}" var="experience">
				<tr>

					<td><img src="assets/images/${experience.playerImage}" height='196px' width='160px' ></td>
         
					<td>${experience.playerFullName}</td>
					<td>${experience.roleName}</td>
					<td>${experience.matches}</td>
					<td>${experience.playerId}</td>
					

				</tr>
			</c:forEach>
</table>
</body>
</html>