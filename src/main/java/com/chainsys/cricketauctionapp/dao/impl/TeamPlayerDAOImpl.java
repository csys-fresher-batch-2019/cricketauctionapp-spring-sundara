package com.playingeleven.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.playingeleven.DbConnection;
import com.playingeleven.DbException;
import com.playingeleven.dao.dto.TeamPlayerPlayers;

import logger.Logger;

public class TeamPlayerDAOImpl {
	private static final Logger log = Logger.getInstance();

	public void addTeamPlayer(int playrId, int teammId, int soldPrice) throws DbException {

		String sql = "insert into teamplayer (playr_id,teamm_id,sold_price) values(?,?,?)";

		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, playrId);
			pst.setInt(2, teammId);
			pst.setInt(3, soldPrice);
			pst.executeUpdate();
		}

		catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to add teamplayer details");
		}
	}

	public ArrayList<TeamPlayerPlayers> viewTeamPlayer(String teamName) throws DbException, SQLException {

		ArrayList<TeamPlayerPlayers> TeamPlayerPlayers = new ArrayList<TeamPlayerPlayers>();
		String sql = "select p.player_image,p.player_fullname,p.role_name,o.player_type,tp.sold_price from players p,country o,teamplayer tp,team t where player_id=playerr_id and playr_id=player_id and team_id = teamm_id and team_name=?";
		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, teamName);
			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					String playerImage = rs.getString("player_image");
					String playerFullName = rs.getString("player_fullname");
					String roleName = rs.getString("role_name");
					String playerType = rs.getString("player_Type");
					int soldPrice = rs.getInt("sold_price");
					com.playingeleven.dao.dto.TeamPlayerPlayers bo = new TeamPlayerPlayers();
					bo.setPlayerImage(playerImage);
					bo.setPlayerFullName(playerFullName);
					bo.setRoleName(roleName);
					bo.setPlayerType(playerType);
					bo.setSoldPrice(soldPrice);
					TeamPlayerPlayers.add(bo);
				}
			}

			catch (SQLException e) {
				log.error(e);
				throw new DbException("unable to list team player details");
			}

			return TeamPlayerPlayers;
		}

	}
}
