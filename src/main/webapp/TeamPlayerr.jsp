<%@page import="com.playingeleven.model.Team"%>
<%@page import="com.playingeleven.dao.impl.TeamDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import="com.playingeleven.model.TeamPlayer" %>
  <%@ page import="com.playingeleven.dao.impl.TeamPlayerDAOImpl" %>
   <%@ page import="com.playingeleven.dao.dto.TeamPlayerPlayers" %>
  <%@ page import="java.util.List" %>
   <%@ page import="java.util.ArrayList" %>
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
.orange{
color:#ffffff;
}
</style>
<body>
<h2>VIEWING TEAM MEMBERS</h2>


<%
String teamName=request.getParameter("tname");
			
			TeamDAOImpl im=new TeamDAOImpl();
			
			ArrayList<Team> a=im.viewTeam(teamName);
			for(Team l:a)
			{%>
			<h4>Team Name&nbsp;&nbsp;:<%=l.getTeamName()%> &nbsp;&nbsp;&nbsp;&nbsp;Team CoachName&nbsp;&nbsp;:&nbsp;<%=l.getTeamCoach()%>&nbsp;&nbsp;Team OwnerName:&nbsp;&nbsp;<%=l.getTeamOwner() %></h4>
			  <h4>Team Id&nbsp;&nbsp;:<%=l.getTeamId()%>&nbsp;&nbsp;&nbsp;&nbsp;   Remaining Amount&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<%=l.getAmountRemaining()%></h4>
			<% }%>
			
			<% TeamPlayerDAOImpl impl = new TeamPlayerDAOImpl();
			impl.viewTeamPlayer(teamName);
			ArrayList<TeamPlayerPlayers> TeamPlayers = impl.viewTeamPlayer(teamName);%>
			  <%if(TeamPlayers!=null &&!TeamPlayers.isEmpty() ){ %>
			  <table><tr>
<th>Player</th>
<th>Player Name</th>
<th>Role Name</th>
<th>Player Type</th>
<th>Sold Price</th>
<tr>                  
						<% for (TeamPlayerPlayers e : TeamPlayers) {
				%>	<tr><td><img src="assets/images/<%=e.getPlayerImage()%>" height='196px' width='160px' ></img></td>
				<td><%=e.getPlayerFullName() %></td>
				<td><%=e.getRoleName() %></td>
				<td><%=e.getPlayerType() %></td>
				<td><%=e.getSoldPrice() %></td>
				
		</tr>
			<%} %>
			<%} 
			else{%>
			<h2>No players are bought!!</h2>
			<%} %>
	</table>

</body>
</html>