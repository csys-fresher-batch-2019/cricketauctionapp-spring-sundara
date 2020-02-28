package com.chainsys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playingeleven.DbException;
import com.playingeleven.dao.impl.TeamPlayerDAOImpl;

/**
 * Servlet implementation class BidPlayerServlet
 */
@WebServlet("/BidPlayerServlet")
public class BidPlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		System.out.println("bid player");
		int playerId = Integer.parseInt(request.getParameter("pid"));
		int cskbid = Integer.parseInt(request.getParameter("cbamount"));
		int mibid = Integer.parseInt(request.getParameter("mbamount"));
		int rcbbid = Integer.parseInt(request.getParameter("rbamount"));
		int srhbid = Integer.parseInt(request.getParameter("sbamount"));
		int kkrbid = Integer.parseInt(request.getParameter("kbamount"));
		
		int n = 1;
		int teamId;
	
		String[] teams = { "CSK", "MI", "RCB", "SRH", "KKR" };
		int[] teamIds = { 101, 102, 103, 104, 105 };
		int selectedTeamId = 0;
		Map<Integer, Integer> bid = new HashMap<Integer, Integer>();
		List<Integer> amountSet = new ArrayList<Integer>();
		amountSet.add(cskbid);
		amountSet.add(mibid);
		amountSet.add(rcbbid);
		amountSet.add(srhbid);
		amountSet.add(kkrbid);
	    
		int max = -1;
		int i=0;
		String teamName=null;
		for(Integer amount:amountSet)
		{
			
			int teaamId = teamIds[i];
			
			if (amount > 0) {
				bid.put(teaamId, amount);
			}
			if ( amount > max) {
				max = amount;
					}	
			i++;
			
		}
		out.print("<html><style>\r\n" + 
				"body {\r\n" + 
				"    background-color: #aaa;\r\n" + 
				"	background-attachment: fixed;\r\n" + 
				"	background-repeat: no-repeat;\r\n" + 
				"	background-size: 100% 100%;\r\n" + 
				"}\r\n" + 
				"body {font-family: Arial, Helvetica, sans-serif;}\r\n" + 
				"</style><body><h3>");
		int id=0;
		Set<Integer> keySet = bid.keySet();
		for (int x : keySet) {
			out.print(x+" "+bid.get(x)+"<br/>");
			if(bid.get(x)==max)
			{
				selectedTeamId=x;
				 
			}
		}
		if(selectedTeamId==101)
		 {
			 teamName=teams[0];
		 }
		 else if(selectedTeamId==102)
		 {
			 teamName=teams[1];
		 }
		 else if(selectedTeamId==103)
			 teamName=teams[2];
		 else if(selectedTeamId==104)
			 teamName=teams[3];
		 else 
			 teamName=teams[4];
		
		
out.print(selectedTeamId);
		
		out.println("Team Name "+teamName+" highest bid is " + max);

		TeamPlayerDAOImpl impl = new TeamPlayerDAOImpl();
		try {
			impl.addTeamPlayer(playerId,selectedTeamId,max);
		} catch (DbException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.print("</h3></body></html>");
			}
}
