package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.Category;

@Transactional
@Service
public class CategoryDAOImpl implements CategoryDAO{
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Category> selectAllCategories() {
		String query = "Select c from Category c";
		
		List<Category> results = em.createQuery(query, Category.class).getResultList();
		
		return results;
	}
}
