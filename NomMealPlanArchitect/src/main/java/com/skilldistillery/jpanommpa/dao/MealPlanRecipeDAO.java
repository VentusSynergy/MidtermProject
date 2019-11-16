package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import com.skilldistillery.jpanommpa.entities.MealPlanRecipe;

public interface MealPlanRecipeDAO {
	public MealPlanRecipe createMealPlanRecipe(MealPlanRecipe m);
	public MealPlanRecipe updateMealPlanRecipe(MealPlanRecipe m);
	public boolean deleteMealPlanRecipe(MealPlanRecipe m);
	public List<MealPlanRecipe> selectAllMealPlanRecipe();
	public List<MealPlanRecipe> selectMealPlanRecipeByRecipe(String recipe);
	public List<MealPlanRecipe> selectMealPlanRecipeByDay(String day);
	public List<MealPlanRecipe> selectMealPlanRecipeBySequenceNum(int seqNum);
	public List<MealPlanRecipe> selectMealPlanRecipeByType(String type);
	public List<MealPlanRecipe> selectMealPlanRecipeByKeyword(String keyword);
	
}
