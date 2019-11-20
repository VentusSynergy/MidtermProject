package com.skilldistillery.jpanommpa.dao;

import java.time.LocalDate;
import java.util.*;

import com.skilldistillery.jpanommpa.entities.UserRecipe;

public interface UserRecipeFavoritesDAO {
	public UserRecipe createUserRecipe(UserRecipe ur);
	public UserRecipe updateUserRecipe(UserRecipe ur);
	public void deleteUserRecipe(int id);
	public List<UserRecipe> selectAllUserRecipe(int id);
	public List<UserRecipe> selectUserRecipeByRecipeName(String name);
	public List<UserRecipe> selectUserRecipeByDateLastMade(LocalDate date);
//	public List<UserRecipe> addRecipeToUser(int id);

}
