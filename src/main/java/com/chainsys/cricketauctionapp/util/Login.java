package com.chainsys.cricketauctionapp.util;

public class Login {
	public String login(String username, String password) {
		if (username.equals("admin") && password.equals("admin")) {
			return ("admin");
		} else {
			return ("user");
		}
	}
}
