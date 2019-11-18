package com.skilldistillery.jpanommpa.dao;

import java.util.List;


import com.skilldistillery.jpanommpa.entities.Category;

public interface CategoryDAO {
	
	
	public List<String> selectAllCategories();
}
