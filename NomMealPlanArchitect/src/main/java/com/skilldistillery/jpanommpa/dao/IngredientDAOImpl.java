package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.Ingredient;

@Transactional
@Service
public class IngredientDAOImpl implements IngredientDAO{
	@PersistenceContext
	private EntityManager em;

	@Override
	public Ingredient createIngredient(Ingredient i) {
		em.persist(i);

		em.flush();

		return i;
	}

	@Override
	public List<Ingredient> selectAllIngredient() {
		String query = "Select i from Ingredient";

		List<Ingredient> results = em.createQuery(query, Ingredient.class).getResultList();

		return results;
	}

	@Override
	public List<Ingredient> selectIngredientByName(String name) {
		String query = "Select i from Ingredient where i.name = :name";

		List<Ingredient> results = em.createQuery(query, Ingredient.class).setParameter("name", name).getResultList();

		return results;
	}

	@Override
	public List<Ingredient> selectIngredientByBrand(String brand) {
		String query = "Select i from Ingredient where i.brand = :brand";

		List<Ingredient> results = em.createQuery(query, Ingredient.class).setParameter("brand", brand).getResultList();

		return results;
	}

	@Override
	public List<Ingredient> selectIngredientByCategory(String category) {
		String query = "Select i from Ingredient where i.category = :category";

		List<Ingredient> results = em.createQuery(query, Ingredient.class).setParameter("category", category).getResultList();

		return results;
	}

	@Override
	public Ingredient updateIngredient(Ingredient i) {
		Ingredient matchingIngredient = em.find(Ingredient.class, i.getId());
		
		matchingIngredient.setName(i.getName());
		matchingIngredient.setBrand(i.getBrand());
		matchingIngredient.setSize(i.getSize());
		matchingIngredient.setCategory(i.getCategory());
		
		em.persist(matchingIngredient);
		
		em.flush();
		
		return matchingIngredient;
		
	}

	@Override
	public boolean deleteIngredient(Ingredient i) {
		Ingredient matchingIngredient = em.find(Ingredient.class, i.getId());
		
		em.remove(matchingIngredient);
		
		em.flush();
		
		Ingredient stillInDB = em.find(Ingredient.class, i.getId());
		if (stillInDB == null) {
			return true;
		} else {
			return false;
		}
	}

}
