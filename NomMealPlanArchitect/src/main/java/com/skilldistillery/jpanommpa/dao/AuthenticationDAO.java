package com.skilldistillery.jpanommpa.dao;

import com.skilldistillery.jpanommpa.entities.User;

public interface AuthenticationDAO {
	public User create(User user);

	public boolean isEmailUnique(String email);

	public boolean isUserNameUnique(String username);

	public User getUserByEmail(String email);

	public boolean isValidUser(User u);

	public User lookUp(String email, String pass);

	public void addUserToMap();

	public User updateUser(int id, User updatedUser);

	User updateActiveStatus(int id);

}
