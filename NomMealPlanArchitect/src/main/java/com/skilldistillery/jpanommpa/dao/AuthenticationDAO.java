package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import com.skilldistillery.jpanommpa.entities.Ingredient;
import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.User;

public interface AuthenticationDAO {
	public User create(User user);

	public boolean isEmailUnique(String email);

	public User getUserByEmail(String email);

	public boolean isValidUser(User u);
	
	public Recipe create(Recipe recipe);
	
	public List<Recipe> showAll();
	
	public Ingredient create(Ingredient ing);
}
