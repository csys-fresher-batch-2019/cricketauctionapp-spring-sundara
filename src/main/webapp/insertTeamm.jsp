<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="com.chainsys.cricketauctionapp.model.Team" %>
  <%@ page import="com.chainsys.cricketauctionapp.dao.impl.TeamDAOImpl" %>
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
<%
String teamName=request.getParameter("tname");
String teamOwner= request.getParameter("towner");
String teamCoach= request.getParameter("tcoach");
int amountRemaining=Integer.parseInt(request.getParameter("aremain"));
Team ob = new Team();
ob.setTeamName(teamName);
ob.setTeamOwner(teamOwner);
ob.setTeamCoach(teamCoach);
ob.setAmountRemaining(amountRemaining);
TeamDAOImpl impl = new TeamDAOImpl();
impl.addTeam( ob.getTeamName(),ob.getTeamOwner(),ob.getTeamCoach(),ob.getAmountRemaining());

%>

</body>
</html>