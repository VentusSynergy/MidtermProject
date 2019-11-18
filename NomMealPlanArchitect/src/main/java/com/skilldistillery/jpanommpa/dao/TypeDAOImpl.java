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
	public List<RecipeType> selectAllRecipeTypes() {
		String query = "Select t from RecipeType t";

		List<RecipeType> results = em.createQuery(query, RecipeType.class).getResultList();

		return results;
	}

}
