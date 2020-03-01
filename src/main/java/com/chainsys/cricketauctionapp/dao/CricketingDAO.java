package com.chainsys.cricketauctionapp.dao;

import java.util.ArrayList;

import com.chainsys.cricketauctionapp.dao.dto.Batting;
import com.chainsys.cricketauctionapp.dao.dto.Bowling;
import com.chainsys.cricketauctionapp.util.DbException;

public interface CricketingDAO {
	void addCricketingDetails(int jerseyNo, String batting, String bowling, String bowlingSpeed) throws DbException;

	public void deleteCricketingDetails(int cricNo) throws DbException;

	public ArrayList<Batting> bestBattingAverage() throws DbException;

	public ArrayList<Bowling> bestBowlingAverage() throws DbException;

}
