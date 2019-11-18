package com.skilldistillery.jpanommpa.dao;

import java.util.*;

import com.skilldistillery.jpanommpa.entities.MealPlan;
import com.skilldistillery.jpanommpa.entities.User;

public interface MealPlanDAO {
	public MealPlan createMealPlan(MealPlan m);

	public MealPlan updateMealPlan(MealPlan m);

	public boolean deleteMealPlan(MealPlan m);

	public List<MealPlan> selectAllMealPlan(MealPlan m);

	public List<MealPlan> selectMealPlanByKeyword(String keyword);

	List<MealPlan> selectMealPlanByUser(User user);
}
