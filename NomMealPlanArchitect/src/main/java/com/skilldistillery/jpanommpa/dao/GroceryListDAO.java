package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import com.skilldistillery.jpanommpa.entities.GroceryList;

public interface GroceryListDAO {
	public List<GroceryList> selectAllGroceryLists();
	public GroceryList createGroceryList(GroceryList g);
	public GroceryList updateGroceryList(GroceryList g);
	public boolean deleteGroceryList(GroceryList g);
}
