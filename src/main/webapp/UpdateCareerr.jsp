<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.playingeleven.model.Career" %>
  <%@ page import="com.playingeleven.dao.impl.CareerDAOImpl" %>
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
int careerNo = Integer.parseInt(request.getParameter("cno"));
int matches = Integer.parseInt(request.getParameter("match"));
int innings = Integer.parseInt(request.getParameter("inn"));
int notOuts = Integer.parseInt(request.getParameter("nouts"));
int runsScored = Integer.parseInt(request.getParameter("rscore"));
int ballsBowled = Integer.parseInt(request.getParameter("bbowl"));
int runsConceded = Integer.parseInt(request.getParameter("rcon"));
int wickets = Integer.parseInt(request.getParameter("wicket"));
int catches = Integer.parseInt(request.getParameter("catch"));
int stumpings = Integer.parseInt(request.getParameter("stump"));
Career ob = new Career();
ob.setCareerNo(careerNo);
ob.setMatches(matches);
ob.setInnings(innings);
ob.setNotOuts(notOuts);
ob.setRunsScored(runsScored);
ob.setBallsBowled(ballsBowled);
ob.setRunsConceded(runsConceded);
ob.setWickets(wickets);
ob.setCatches(catches);
ob.setStumpings(stumpings);
CareerDAOImpl impl = new CareerDAOImpl();
impl.updateCareerDetails(ob.getCareerNo(), ob.getCatches(), ob.getInnings(), ob.getNotOuts(),
		ob.getRunsScored(), ob.getBallsBowled(), ob.getRunsConceded(), ob.getWickets(), ob.getCatches(),
		ob.getStumpings());
%>

</body>
</html>