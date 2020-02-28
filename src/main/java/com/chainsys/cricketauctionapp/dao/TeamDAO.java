package com.playingeleven.dao;

import java.util.ArrayList;

import com.playingeleven.DbException;
import com.playingeleven.model.Team;

public interface TeamDAO {
	public void addTeam(String teamName, String teamOwner, String teamCoach, int amountRemaining) throws DbException;

	public ArrayList<Team> viewTeam(String teamName) throws DbException;
}
