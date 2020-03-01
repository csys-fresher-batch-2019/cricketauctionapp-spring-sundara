package com.chainsys.cricketauctionapp.dao;

import java.util.ArrayList;

import com.chainsys.cricketauctionapp.dao.dto.TeamPlayerPlayers;
import com.chainsys.cricketauctionapp.util.DbException;

public interface TeamPlayerDAO {
	public void addTeamPlayer(int playrId, int teammId, int soldPrice) throws DbException;

	public ArrayList<TeamPlayerPlayers> viewTeamPlayer(String teamName) throws DbException;
}
