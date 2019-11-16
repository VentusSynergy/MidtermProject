package com.skilldistillery.jpanommpa.dao;

import com.skilldistillery.jpanommpa.entities.GroceryList;

public interface GroceryListDAO {
	public GroceryList createGroceryList(GroceryList g);
	public GroceryList updateGroceryList(GroceryList g);
	public boolean deleteGroceryList(GroceryList g);
}
