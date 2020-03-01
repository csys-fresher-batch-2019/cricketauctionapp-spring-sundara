package com.chainsys.cricketauctionapp.dao;

import com.chainsys.cricketauctionapp.util.DbException;

public interface CareerDAO {

	public void addCareerDetails(int matches, int innings, int notOuts, int runsScored, int ballsBowled,
			int runsConceded, int wickets, int catches, int stumpings) throws DbException;

	public void deleteCareerDetails(int careerNo) throws DbException;

	public void updateCareerDetails(int careerNo, int matches, int innings, int notOuts, int runsScored,
			int ballsBowled, int runsConceded, int wickets, int catches, int stumpings) throws DbException;

}
