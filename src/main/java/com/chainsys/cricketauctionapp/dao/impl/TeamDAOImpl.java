package com.chainsys.cricketauctionapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.chainsys.cricketauctionapp.dao.TeamDAO;
import com.chainsys.cricketauctionapp.logger.Logger;
import com.chainsys.cricketauctionapp.model.Team;
import com.chainsys.cricketauctionapp.util.DbConnection;
import com.chainsys.cricketauctionapp.util.DbException;

public class TeamDAOImpl implements TeamDAO {
	private static final Logger log = Logger.getInstance();

	public void addTeam(String teamName, String teamOwner, String teamCoach, int amountRemaining) throws DbException {
		String sql = "insert into team (team_id,team_name,team_owner,team_coach,amount_remaining) values(team_id_sq.nextVal,?,?,?,?)";

		try (Connection con = DbConnection.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setString(1, teamName);
			stmt.setString(2, teamOwner);
			stmt.setString(3, teamCoach);
			stmt.setInt(4, amountRemaining);
			stmt.executeUpdate();
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to add team details");
		}
	}

	@Override
	public ArrayList<Team> viewTeam(String teamName) throws DbException {
		ArrayList<Team> l = new ArrayList<Team>();
		String sqll = "select * from team where team_name=?";

		try (Connection con = DbConnection.getConnection(); PreparedStatement stmt = con.prepareStatement(sqll);) {
			stmt.setString(1, teamName);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					Team t = new Team();
					t.setAmountRemaining(rs.getInt("amount_remaining"));
					t.setTeamName(rs.getString("team_name"));
					t.setTeamCoach(rs.getString("team_coach"));
					t.setTeamOwner(rs.getString("team_owner"));
					t.setTeamId(rs.getInt("team_id"));
					l.add(t);
				}
			}

		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to view team player details");
		}
		return l;
	}

}
