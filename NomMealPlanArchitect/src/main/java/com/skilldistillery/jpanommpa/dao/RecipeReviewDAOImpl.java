package com.skilldistillery.jpanommpa.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;


import com.skilldistillery.jpanommpa.entities.RecipeReview;

@Transactional
@Service
public class RecipeReviewDAOImpl implements RecipeReviewDAO{
	@PersistenceContext
	EntityManager em;

	@Override
	public RecipeReview createRecipeReview(RecipeReview r) {
		em.persist(r);
		
		em.flush();
		
		return r;
	}

	@Override
	public RecipeReview updateRecipeReview(RecipeReview r) {
		RecipeReview matchingRR = em.find(RecipeReview.class, r.getId());

		matchingRR.setId(r.getId());
		matchingRR.setRecipe(r.getRecipe());
		matchingRR.setRating(r.getRating());
		matchingRR.setReviewDate(LocalDate.now());
		matchingRR.setComment(r.getComment());
		matchingRR.setActive(true);
		
		em.persist(matchingRR);

		em.flush();

		return matchingRR;
	}

	@Override
	public boolean deleteRecipeReview(RecipeReview r) {
		RecipeReview matchingRR = em.find(RecipeReview.class, r.getId());
		
		matchingRR.setActive(false);
		
		em.persist(matchingRR);
		
		em.flush();
		
		return true;
		
	}

	@Override
	public List<RecipeReview> selectAllRecipeReview() {
		String query = "Select r from RecipeReview r";

		List<RecipeReview> results = em.createQuery(query, RecipeReview.class).getResultList();

		return results;
	}

	@Override
	public List<RecipeReview> selectRecipeReviewByUserID(int id) {
		String query = "Select r from RecipeReview r where r.user.id = :id";

		List<RecipeReview> results = em.createQuery(query, RecipeReview.class).setParameter("id", id).getResultList();

		return results;
	}

	@Override
	public List<RecipeReview> selectRecipeReviewByRating(int rating) {
		String query = "Select r from RecipeReview r where r.rating = :rating";

		List<RecipeReview> results = em.createQuery(query, RecipeReview.class).setParameter("rating", rating).getResultList();

		return results;
	}

	@Override
	public List<RecipeReview> selectRecipeReviewByRecipeID(int id) {
		String query = "Select r from RecipeReview r where r.recipe.id = :id";

		List<RecipeReview> results = em.createQuery(query, RecipeReview.class).setParameter("id", id).getResultList();

		return results;
	}

	@Override
	public List<RecipeReview> selectRecipeReviewByRecipeName(String recipeName) {
		String query = "Select r from RecipeReview r where r.recipe.name like :name";

		List<RecipeReview> results = em.createQuery(query, RecipeReview.class).setParameter("name", "%" + recipeName + "%").getResultList();

		return results;
	}

}
