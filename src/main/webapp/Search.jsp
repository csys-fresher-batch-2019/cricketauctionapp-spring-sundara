<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList" %>
      <%@ page import="java.util.List" %>
      
      <%@ page import="com.playingeleven.model.Players" %>
  <%@ page import="com.playingeleven.dao.impl.PlayersDAOImpl" %>
     <%@ page import="com.playingeleven.dao.dto.Batting" %>
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
</style>

<body>
<h2>view players</h2>
<table><tr>
<th>Player</th>
<th>Player Name</th>
<th>Role Name</th>
<th>Player Id</th>
<th>Sold to</th>
</tr>
<%
PlayersDAOImpl p=new PlayersDAOImpl();
List<Players> lp=new ArrayList<Players>();
String s=request.getParameter("search"); 
lp=p.searchPlayers(s);

for(Players p1:lp)
 {
	if(p1.getTeamName()==null)
	 {
		 p1.setTeamName("Not Sold");
	 }
	
	%>	<tr>
	<td><img src="assets/images/<%=p1.getPlayerImage()%>" height='196px' width='160px' ></img></td>
			<td><%=p1.getPlayerFullName() %></td>
			<td><%=p1.getRoleName() %></td>
			<td><%=p1.getPlayerId() %></td>
			<td><%=p1.getTeamName()%></td>
			</tr>
		<%} %>

</table>

</body>

</html>