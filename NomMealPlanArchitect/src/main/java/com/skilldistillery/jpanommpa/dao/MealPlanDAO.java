package com.skilldistillery.jpanommpa.dao;

import com.skilldistillery.jpanommpa.entities.MealPlan;

public interface MealPlanDAO {
	public MealPlan createMealPlan(MealPlan m);
	public MealPlan updateMealPlan(MealPlan m);
	public boolean deleteMealPlan(MealPlan m);
	public MealPlan selectAllMealPlan(MealPlan m);
	public MealPlan selectMealPlanByKeyword(String keyword);
}
