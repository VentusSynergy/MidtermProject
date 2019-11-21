package com.skilldistillery.jpanommpa.dao;

import java.util.Collections;
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
	public List<String> selectAllIngredient() {
		String query = "Select i.name from Ingredient i";

		List<String> results = em.createQuery(query, String.class).getResultList();
		
		Collections.sort(results);

		return results;
	}

	@Override
	public List<Ingredient> selectIngredientByName(String name) {
		String query = "Select i from Ingredient i where i.name like :name";

		List<Ingredient> results = em.createQuery(query, Ingredient.class).setParameter("name", "%" + name + "%").getResultList();
		
		return results;
	}

	@Override
	public List<Ingredient> selectIngredientByBrand(String brand) {
		String query = "Select i from Ingredient i where i.brand like :brand";

		List<Ingredient> results = em.createQuery(query, Ingredient.class).setParameter("brand", "%" + brand + "%").getResultList();
		
		return results;
	}

	@Override
	public List<Ingredient> selectIngredientByCategory(String category) {
		String query = "Select i from Ingredient i where i.category = :category";

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

	@Override
	public List<Ingredient> selectAllIngredientObjects() {
		String query = "Select i from Ingredient i where i.name <> '' and i.name <> 'tbsp' and i.name not like '%b1less%' and i.name not like 'h1y' and i.name not like '%10derloin%' and i.name not like '%seas1d%' order by i.name";

		List<Ingredient> results = em.createQuery(query, Ingredient.class).getResultList();
		
		

		return results;
	}

	@Override
	public Ingredient selectIngredientById(int id) {
		return em.find(Ingredient.class, id);
	}

}
