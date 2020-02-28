<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import=" java.time.LocalDate" %>
     <%@ page import="com.playingeleven.model.Players" %>   
  <%@ page import="com.playingeleven.dao.impl.PlayersDAOImpl"%>   
  <%@ page import="com.playingeleven.model.Career" %>
  <%@ page import="com.playingeleven.dao.impl.CareerDAOImpl" %>
    <%@ page import="com.playingeleven.model.Cricketing" %>
  <%@ page import="com.playingeleven.dao.impl.CricketingDAOImpl" %>
      <%@ page import="com.playingeleven.model.Country" %>
  <%@ page import="com.playingeleven.dao.impl.CountryDAOImpl" %>
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
<%String playerFullName = request.getParameter("fname");
		String date = request.getParameter("dob");
		LocalDate dateOfBirth = LocalDate.parse(date);
		String nickName = request.getParameter("nname");
		String roleName = request.getParameter("rname");
		String playerImage = request.getParameter("pic");
		Players ob = new Players();
		ob.setPlayerFullName(playerFullName);
		ob.setDateOfBirth(dateOfBirth);
		ob.setNickName(nickName);
		ob.setRoleName(roleName);
		ob.setPlayerImage(playerImage);
		PlayersDAOImpl impl = new PlayersDAOImpl();
		impl.addPlayerDetails(ob);
		
		int jerseyNo=Integer.parseInt(request.getParameter("jno"));
		String batting = request.getParameter("bat");
		String bowling = request.getParameter("bowl");
		String bowlingSpeed= request.getParameter("speed");
		
		
		Cricketing ob2 = new Cricketing();
		ob2.setJerseyNo(jerseyNo);
		ob2.setBatting(batting);
		ob2.setBowling(bowling);
		ob2.setBowlingSpeed(bowlingSpeed);
		CricketingDAOImpl impl2 = new CricketingDAOImpl();
		impl2.addCricketingDetails(ob2.getJerseyNo(),  ob2.getBatting(), ob2.getBowling(), ob2.getBowlingSpeed());
		
		int matches=Integer.parseInt(request.getParameter("match"));
		int innings=Integer.parseInt(request.getParameter("inn"));
		int notOuts=Integer.parseInt(request.getParameter("nouts"));
		int runsScored=Integer.parseInt(request.getParameter("rscore"));
		int ballsBowled=Integer.parseInt(request.getParameter("bbowl"));
		int runsConceded=Integer.parseInt(request.getParameter("rcon"));
		int wickets=Integer.parseInt(request.getParameter("wicket"));
		int catches=Integer.parseInt(request.getParameter("catch"));
		int stumpings=Integer.parseInt(request.getParameter("stump"));
		
	
		
		
	    Career ob1 = new Career();
	    ob1.setMatches(matches);
	    ob1.setInnings(innings);
		ob1.setNotOuts(notOuts);
		ob1.setRunsScored(runsScored); 
		ob1.setBallsBowled(ballsBowled);
		ob1.setRunsConceded(runsConceded);
		ob1.setWickets(wickets);
		ob1.setCatches(catches);
		ob1.setStumpings(stumpings);
		CareerDAOImpl impl1 = new CareerDAOImpl();
		impl1.addCareerDetails(ob1.getMatches(), ob1.getInnings(), ob1.getNotOuts(), ob1.getRunsScored(),
				ob1.getBallsBowled(), ob1.getRunsConceded(), ob1.getWickets(), ob1.getCatches(), ob1.getStumpings());
		
		int basicPrice=Integer.parseInt(request.getParameter("bprice"));
		String countryName= request.getParameter("cname");
		String playerType= request.getParameter("play");
		
        
		 Country ob3 = new Country();
		 
		    ob3.setCountryName(countryName);
		    ob3.setPlayerType(playerType);
		    ob3.setBasicPrice(basicPrice);
		    CountryDAOImpl impl3 = new CountryDAOImpl();
			impl3.addCountry(ob3.getCountryName(),ob3.getPlayerType(),ob3.getBasicPrice());
	%> 
		
</body>
</html>