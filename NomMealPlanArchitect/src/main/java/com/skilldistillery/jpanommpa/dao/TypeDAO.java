package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import com.skilldistillery.jpanommpa.entities.RecipeType;

public interface TypeDAO {
	public List<RecipeType> selectAllRecipeTypes();
}
