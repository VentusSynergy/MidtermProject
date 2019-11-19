package com.skilldistillery.jpanommpa.dao;

import java.util.*;

import com.skilldistillery.jpanommpa.entities.Ingredient;

public interface IngredientDAO {
	public Ingredient createIngredient(Ingredient i);
	public Ingredient selectIngredientById(int id);
	public List<String> selectAllIngredient();
	public List<Ingredient> selectAllIngredientObjects();
	public List<Ingredient> selectIngredientByName(String name);
	public List<Ingredient> selectIngredientByBrand(String brand);
	public List<Ingredient> selectIngredientByCategory(String category);
	public Ingredient updateIngredient(Ingredient i);
	public boolean deleteIngredient(Ingredient i);
}
