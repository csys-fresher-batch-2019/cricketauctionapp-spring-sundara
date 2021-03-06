package com.chainsys.cricketauctionapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.chainsys.cricketauctionapp.dao.CricketingDAO;
import com.chainsys.cricketauctionapp.dao.dto.Batting;
import com.chainsys.cricketauctionapp.dao.dto.Bowling;
import com.chainsys.cricketauctionapp.logger.Logger;
import com.chainsys.cricketauctionapp.util.DbConnection;
import com.chainsys.cricketauctionapp.util.DbException;

public class CricketingDAOImpl implements CricketingDAO {
	private static final Logger log = Logger.getInstance();

	public void addCricketingDetails(int jerseyNo, String batting, String bowling, String bowlingSpeed)
			throws DbException {
		String sql = "insert into cricketing(cric_no,jersey_no,batting,bowling,bowling_speed)values(cric_no_sq.nextval,?,?,?,?)";

		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, jerseyNo);
			pst.setString(2, batting);
			pst.setString(3, bowling);
			pst.setString(4, bowlingSpeed);
			pst.executeUpdate();

		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to add cricketing details");
		}
	}

	public void deleteCricketingDetails(int cricNo) throws DbException {

		String sql = "DELETE FROM cricketing WHERE cric_no=?";

		try (Connection con = DbConnection.getConnection();

				PreparedStatement pst = con.prepareStatement(sql)) {
			pst.executeUpdate();
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to remove cricketing details");
		}
	}

	public ArrayList<Batting> bestBattingAverage() throws DbException {
		ArrayList<Batting> Batting = new ArrayList<Batting>();
		String sql = "select * from ( select p.player_image,p.player_fullname as player_fullname,p.role_name as role_name,r.batting as batting,round(BATTING_AVERAGE_CALC(runs_scored, not_outs,innings),2)as batting_average, rank() over (order by round(BATTING_AVERAGE_CALC(runs_scored,not_outs,innings)) desc) as rank from players p, career c,cricketing r where p.player_id = c.career_no and p.player_id=r.cric_no and  (role_name IN('batsman','wicketkeeper/Batsman')) and active=1) ";
		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					String playerImage = rs.getString("player_image");
					String playerFullName = rs.getString("player_fullname");
					String roleName = rs.getString("role_name");
					String batting = rs.getString("batting");
					int battingAverage = rs.getInt("batting_average");
					int rank = rs.getInt("rank");
					com.chainsys.cricketauctionapp.dao.dto.Batting b = new Batting();
					b.setPlayerImage(playerImage);
					b.setPlayerFullName(playerFullName);
					b.setRoleName(roleName);
					b.setBatting(batting);
					b.setBattingAverage(battingAverage);
					b.setRank(rank);
					Batting.add(b);

				}

			}
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to show batting average details");
		}
		return Batting;
	}

	public ArrayList<Bowling> bestBowlingAverage() throws DbException {
		ArrayList<Bowling> Bowling = new ArrayList<Bowling>();
		String sql = "select * from ( select p.player_image,p.player_fullname,p.role_name,r.bowling,r.bowling_speed,round(BOWLING_AVERAGE_CALC (runs_conceded,wickets),2) as bowling_average, rank() over (order by round(BOWLING_AVERAGE_CALC(runs_conceded,wickets)) asc) as rank from players p, career c,cricketing r where p.player_id = c.career_no and p.player_id=r.cric_no and role_name='bowler' and active=1  )";
		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					String playerImage = rs.getString("player_image");
					String playerFullName = rs.getString("player_fullname");
					String roleName = rs.getString("role_name");
					String bowling = rs.getString("bowling");
					int bowlingAverage = rs.getInt("bowling_average");
					int rank = rs.getInt("rank");
					com.chainsys.cricketauctionapp.dao.dto.Bowling bo = new Bowling();
					bo.setPlayerImage(playerImage);
					bo.setPlayerFullName(playerFullName);
					bo.setRoleName(roleName);
					bo.setBowling(bowling);
					bo.setBowlingAverage(bowlingAverage);
					bo.setRank(rank);
					Bowling.add(bo);
				}

			}
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to show bowling average details");
		}
		return Bowling;
	}
}
