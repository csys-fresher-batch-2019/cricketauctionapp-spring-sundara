package com.chainsys.cricketauctionapp.dao;

import java.util.ArrayList;

import com.chainsys.cricketauctionapp.model.Team;
import com.chainsys.cricketauctionapp.util.DbException;

public interface TeamDAO {
	public void addTeam(String teamName, String teamOwner, String teamCoach, int amountRemaining) throws DbException;

	public ArrayList<Team> viewTeam(String teamName) throws DbException;
}
