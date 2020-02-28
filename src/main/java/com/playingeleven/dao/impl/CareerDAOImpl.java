package com.playingeleven.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.playingeleven.DbConnection;
import com.playingeleven.DbException;
import com.playingeleven.dao.CareerDAO;

import logger.Logger;

public class CareerDAOImpl implements CareerDAO {
	private static final Logger log = Logger.getInstance();

	public void addCareerDetails(int matches, int innings, int notOuts, int runsScored, int ballsBowled,
			int runsConceded, int wickets, int catches, int stumpings) throws DbException {

		String sql = "insert into career(career_no,matches,innings,not_outs,runs_scored,balls_bowled,runs_conceded,wickets,catches,stumpings) values(career_no_sq.nextval,?,?,?,?,?,?,?,?,?,?)";

		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, matches);
			pst.setInt(2, innings);
			pst.setInt(3, notOuts);
			pst.setInt(4, runsScored);
			pst.setInt(5, ballsBowled);
			pst.setInt(6, runsConceded);
			pst.setInt(7, wickets);
			pst.setInt(8, catches);
			pst.setInt(9, catches);
			pst.setInt(10, stumpings);
			pst.executeUpdate();
		} catch (SQLException e) {

			log.error(e);
			throw new DbException("unable to add career");
		}

	}

	public void deleteCareerDetails(int careerNo) throws DbException {

		String sql = "DELETE FROM career WHERE career_no=?";
		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			pst.setInt(1, careerNo);
			pst.executeUpdate();
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to remove career");
			
		}

	}

	public void updateCareerDetails(int careerNo, int matches, int innings, int notOuts, int runsScored,
			int ballsBowled, int runsConceded, int wickets, int catches, int stumpings) throws DbException {

		String sql = "update career set matches=matches +?,innings=innings+?,not_outs=not_outs+?,runs_scored=runs_scored+?,balls_bowled=balls_bowled+ ?,runs_conceded=runs_conceded+ ?,wickets=wickets+ ?,catches=catches+?,stumpings=stumpings+? where career_no=?";
		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			pst.setInt(1, matches);
			pst.setInt(2, innings);
			pst.setInt(3, notOuts);
			pst.setInt(4, runsScored);
			pst.setInt(5, ballsBowled);
			pst.setInt(6, runsConceded);
			pst.setInt(7, wickets);
			pst.setInt(8, catches);
			pst.setInt(9, catches);
			pst.setInt(10, stumpings);
			pst.setInt(11, careerNo);
			pst.executeUpdate();
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to update career");
		}

	}

}
