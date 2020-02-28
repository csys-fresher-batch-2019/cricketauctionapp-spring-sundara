package com.playingeleven.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.playingeleven.DbConnection;
import com.playingeleven.DbException;
import com.playingeleven.dao.PlayersDAO;
import com.playingeleven.dao.dto.Experience;
import com.playingeleven.model.Players;

import logger.Logger;

public class PlayersDAOImpl implements PlayersDAO {
	private static final Logger log = Logger.getInstance();

	public void addPlayerDetails(Players player) throws DbException {
		String sql = "INSERT INTO players(player_id,player_fullname,date_of_birth,nick_name,role_name,player_image) VALUES (player_id_sq.nextval,?,?,?,?,?)";

		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			pst.setString(1, player.getPlayerFullName());
			pst.setDate(2, Date.valueOf(player.getDateOfBirth()));
			pst.setString(3, player.getNickName());
			pst.setString(4, player.getRoleName());
			pst.setString(5, player.getPlayerImage());
			pst.executeUpdate();
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to add player details");
		}
	}

	public void deletePlayerDetails(LocalDate dateOfBirth) throws DbException {
		String sql = "UPDATE players  SET active=0  WHERE date_of_birth < ?";

		try (Connection con = DbConnection.getConnection();

				PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setDate(1, Date.valueOf(dateOfBirth));
			pst.executeUpdate();
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to delete player details");
		}
	}

	public List<Players> listRoleOfPlayers(String roleName) throws DbException {

		List<Players> list = new ArrayList<Players>();
		String sql = "select player_id,player_image,player_fullname from players where lower(role_name)=lower('"
				+ roleName + "') and active =1";
		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					Players p = new Players();
					p.setPlayerId(rs.getInt("player_id"));
					p.setPlayerImage(rs.getString("player_image"));
					p.setPlayerFullName(rs.getString("player_fullname"));
					list.add(p);
				}
			}
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to list role of player details");
		}
		return list;
	}

	public ArrayList<Experience> listOfExperiencedPlayers() throws DbException {
		ArrayList<Experience> Experience = new ArrayList<Experience>();
		String sql = "select players.player_image as player_image,players.player_fullname as player_fullname,career.matches as matches,players.player_id as playerId,players.role_name as roleName from players inner join career on player_id=career_no where active=1 order by matches desc";
		try (Connection con = DbConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					String playerImage = rs.getString(1);
					String playerFullName = rs.getString(2);
					int matches = rs.getInt(3);
					int playerId = rs.getInt(4);
					String roleName = rs.getString(5);
					com.playingeleven.dao.dto.Experience e = new Experience();
					e.setPlayerImage(playerImage);
					e.setPlayerFullName(playerFullName);
					e.setMatches(matches);
					e.setPlayerId(playerId);
					e.setRoleName(roleName);
					Experience.add(e);
				}
			}

		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to list experienced player details");
		}

		return Experience;

	}

	public List<Players> searchPlayers(String playerName) throws DbException {
		String sql = "select * from players p where player_fullname LIKE ?";
		String sql1 = "select team_name from team where team_id =(select teamm_id from teamplayer where playr_id =?)";
		List<Players> lp = new ArrayList<Players>();

		try (Connection con = DbConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql);
				PreparedStatement stmt1 = con.prepareStatement(sql1)) {
			stmt.setString(1, capitalize(playerName) + "%");
			try (ResultSet rs = stmt.executeQuery();) {
				while (rs.next()) {
					Players p = new Players();

					p.setPlayerId(rs.getInt(1));
					p.setPlayerFullName(rs.getString(2));
					p.setRoleName(rs.getString(5));
					p.setPlayerImage(rs.getString(6));

					stmt1.setInt(1, p.getPlayerId());
					try (ResultSet rs1 = stmt1.executeQuery();) {
						if (rs1.next()) {
							p.setTeamName(rs1.getString(1));

						}
					} catch (Exception e) {
						// TODO: handle exception
					}
					lp.add(p);
				}
			}
		} catch (SQLException e) {
			log.error(e);
			throw new DbException("unable to show details");
		}

		return (lp);
	}

	public static String capitalize(String str) {
		if (str == null)
			return str;
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}

}
