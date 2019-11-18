package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.RecipeType;

@Transactional
@Service
public class TypeDAOImpl implements TypeDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<String> selectAllRecipeTypes() {
		String query = "Select t.name from RecipeType t";

		List<String> results = em.createQuery(query, String.class).getResultList();

		return results;
	}

}
