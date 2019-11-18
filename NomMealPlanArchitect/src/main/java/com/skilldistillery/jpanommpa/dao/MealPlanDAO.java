package com.skilldistillery.jpanommpa.dao;

import java.util.*;

import com.skilldistillery.jpanommpa.entities.MealPlan;

public interface MealPlanDAO {
	public MealPlan createMealPlan(MealPlan m);
	public MealPlan updateMealPlan(MealPlan m);
	public boolean deleteMealPlan(MealPlan m);
	public List<MealPlan> selectAllMealPlan(MealPlan m);
	public List<MealPlan> selectMealPlanByKeyword(String keyword);
}
