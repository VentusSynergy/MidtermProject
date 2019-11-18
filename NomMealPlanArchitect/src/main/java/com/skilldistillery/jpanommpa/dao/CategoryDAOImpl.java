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
	public List<String> selectAllCategories() {
		String query = "Select c.name from Category c";
		
		List<String> results = em.createQuery(query, String.class).getResultList();
		
		return results;
	}
}
