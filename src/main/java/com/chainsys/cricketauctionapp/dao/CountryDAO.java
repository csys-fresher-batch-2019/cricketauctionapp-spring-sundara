package com.chainsys.cricketauctionapp.dao;

import com.chainsys.cricketauctionapp.util.DbException;

public interface CountryDAO {
	public void addCountry(String countryName, String playerType, int basicPrice) throws DbException;

}
