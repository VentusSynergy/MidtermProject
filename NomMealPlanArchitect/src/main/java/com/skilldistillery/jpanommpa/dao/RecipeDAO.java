package com.skilldistillery.jpanommpa.dao;

import java.util.*;

import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.RecipeIngredient;

public interface RecipeDAO {
	public Recipe createRecipe(Recipe r, RecipeIngredient[] ri);
	public Recipe selectRecipeById(int id);
//	public List<Recipe> selectAllPublicRecipe();
//	public List<Recipe> selectPublicRecipeByName(String name);
//	public boolean isRecipePublic(int id);
//	public List<Recipe> selectPublicRecipeByCategory(String category);
//	public List<Recipe> selectPublicRecipeByIngredient(String ingredient);
//	public List<Recipe> selectPublicRecipeByType(String type);
//	public List<Recipe> selectPublicRecipeByCookbook(String cookbook);
	public List<Recipe> selectAllRecipe();
	public List<Recipe> selectRecipeByName(String name);
	public List<Recipe> selectRecipeByCategory(String category);
	public List<Recipe> selectRecipeByIngredient(String ingredient);
	public List<Recipe> selectRecipeByType(String type);
	public List<Recipe> selectRecipeByCookbook(String cookbook);
	public Recipe updateRecipe(Recipe r, RecipeIngredient[] ri);
	public boolean deleteRecipe(Recipe r);
}
