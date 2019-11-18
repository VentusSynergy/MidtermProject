package com.skilldistillery.jpanommpa.dao;

import java.time.LocalDate;
import java.util.*;

import com.skilldistillery.jpanommpa.entities.UserRecipe;

public interface UserRecipeFavoritesDAO {
	public UserRecipe createUserRecipe(UserRecipe ur);
	public UserRecipe updateUserRecipe(UserRecipe ur);
	public boolean deleteUserRecipe(UserRecipe ur);
	public List<UserRecipe> selectAllUserRecipe();
	public List<UserRecipe> selectUserRecipeByRecipeName(String name);
	public List<UserRecipe> selectUserRecipeByDateLastMade(LocalDate date);
//	public List<UserRecipe> addRecipeToUser(int id);

}
