package com.chainsys.cricketauctionapp.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.chainsys.cricketauctionapp.dao.dto.Experience;
import com.chainsys.cricketauctionapp.model.Players;
import com.chainsys.cricketauctionapp.util.DbException;

public interface PlayersDAO {

	public void addPlayerDetails(Players player) throws DbException;

	public void deletePlayerDetails(LocalDate dateOfBirth) throws DbException;

	public List<Players> listRoleOfPlayers(String roleName) throws DbException;

	public ArrayList<Experience> listOfExperiencedPlayers() throws DbException;

	public List<Players> searchPlayers(String playerName) throws DbException;

}
