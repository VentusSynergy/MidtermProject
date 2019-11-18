package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.Ingredient;
import com.skilldistillery.jpanommpa.entities.MealPlanRecipe;

@Transactional
@Service
public class MealPlanRecipeDAOImpl implements MealPlanRecipeDAO {
	@PersistenceContext
	EntityManager em;

	@Override
	public MealPlanRecipe createMealPlanRecipe(MealPlanRecipe m) {
		em.persist(m);

		em.flush();

		return m;

	}

	@Override
	public MealPlanRecipe updateMealPlanRecipe(MealPlanRecipe m) {
		MealPlanRecipe matchingMealPlanRecipe = em.find(MealPlanRecipe.class, m.getId());

		matchingMealPlanRecipe.setSequenceNumber(m.getSequenceNumber());
		matchingMealPlanRecipe.setDay(m.getDay());
		matchingMealPlanRecipe.setRecipe(m.getRecipe());
		matchingMealPlanRecipe.setMealPlan(m.getMealPlan());
		matchingMealPlanRecipe.setType(m.getType());

		em.persist(matchingMealPlanRecipe);

		em.flush();

		return matchingMealPlanRecipe;
	}

	@Override
	public boolean deleteMealPlanRecipe(MealPlanRecipe m) {
		MealPlanRecipe matchingMealPlanRecipe = em.find(MealPlanRecipe.class, m.getId());

		em.remove(matchingMealPlanRecipe);

		em.flush();

		MealPlanRecipe stillInDB = em.find(MealPlanRecipe.class, m.getId());
		if (stillInDB == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<MealPlanRecipe> selectAllMealPlanRecipe() {
		String query = "Select m from MealPlanRecipe";

		List<MealPlanRecipe> results = em.createQuery(query, MealPlanRecipe.class).getResultList();

		return results;
	}

	@Override
	public List<MealPlanRecipe> selectMealPlanRecipeByRecipe(String recipe) {
		String query = "Select m from MealPlanRecipe where m.recipe.name = :name";

		List<MealPlanRecipe> results = em.createQuery(query, MealPlanRecipe.class).setParameter("name", recipe).getResultList();

		return results;
	}

	@Override
	public List<MealPlanRecipe> selectMealPlanRecipeByDay(String day) {
		String query = "Select m from MealPlanRecipe where m.day = :day";

		List<MealPlanRecipe> results = em.createQuery(query, MealPlanRecipe.class).setParameter("day", day).getResultList();

		return results;
	}

	@Override
	public List<MealPlanRecipe> selectMealPlanRecipeBySequenceNum(int seqNum) {
		String query = "Select m from MealPlanRecipe where m.sequenceNumber = :s";

		List<MealPlanRecipe> results = em.createQuery(query, MealPlanRecipe.class).setParameter("s", seqNum).getResultList();

		return results;
	}

	@Override
	public List<MealPlanRecipe> selectMealPlanRecipeByType(String type) {
		String query = "Select m from MealPlanRecipe where m.type = :t";

		List<MealPlanRecipe> results = em.createQuery(query, MealPlanRecipe.class).setParameter("t", type).getResultList();

		return results;
	}

	@Override
	public List<MealPlanRecipe> selectMealPlanRecipeByKeyword(String keyword) {
		String query = "Select m from MealPlanRecipe where m.day like '%word%' or m.type like '%word%' or m.recipe.name like '%word%' ";

		List<MealPlanRecipe> results = em.createQuery(query, MealPlanRecipe.class).setParameter("word", keyword).getResultList();

		return results;
	}

}
