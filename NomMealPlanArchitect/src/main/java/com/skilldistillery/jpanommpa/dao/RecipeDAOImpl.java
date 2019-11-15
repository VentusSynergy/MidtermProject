package com.skilldistillery.jpanommpa.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.*;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.Recipe;

@Transactional
@Service
public class RecipeDAOImpl implements RecipeDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Recipe createRecipe(Recipe r) {
		em.persist(r);

		em.flush();

		return r;
	}

	@Override
	public List<Recipe> selectAllRecipe() {
		String query = "Select r from Recipe";

		List<Recipe> results = em.createQuery(query, Recipe.class).getResultList();

		return results;
	}

	@Override
	public List<Recipe> selectRecipeByName(String name) {
		String query = "Select r from Recipe where r.name = :name";

		List<Recipe> results = em.createQuery(query, Recipe.class).setParameter("name", name).getResultList();

		return results;
	}

	@Override
	public List<Recipe> selectRecipeByKeyword(String keyword) {
		String query = "Select r from Recipe where r.name like '%:word%' or r.cookbook like '%:word%' or r.category.name like '%:word%' or r.type.name like '%:word%'";

		List<Recipe> results = em.createQuery(query, Recipe.class).setParameter("word", keyword).getResultList();

		return results;
	}

	@Override
	public List<Recipe> selectRecipeByCategory(String category) {
		String query = "Select r from Recipe where r.category.name like '%:word%'";

		List<Recipe> results = em.createQuery(query, Recipe.class).setParameter("word", category).getResultList();

		return results;
	}

	@Override
	public List<Recipe> selectRecipeByIngredient(String ingredient) {
		String query = "Select r from Recipe where r.recipeIngredients.ingredient.name = :name";

		List<Recipe> results = em.createQuery(query, Recipe.class).setParameter("name", ingredient).getResultList();

		return results;
	}

	@Override
	public List<Recipe> selectRecipeByType(String type) {
		String query = "Select r from Recipe where r.type.name like '%:word%'";

		List<Recipe> results = em.createQuery(query, Recipe.class).setParameter("word", type).getResultList();

		return results;
	}

	@Override
	public List<Recipe> selectRecipeByCookbook(String cookbook) {
		String query = "Select r from Recipe where r.cookbook like '%:word%'";

		List<Recipe> results = em.createQuery(query, Recipe.class).setParameter("word", cookbook).getResultList();

		return results;
	}

	@Override
	public Recipe updateRecipe(Recipe r) {
		//get a match from the database
		Recipe matchingRecipe = em.find(Recipe.class, r.getId());
		
		//update to match user form input
		matchingRecipe.setName(r.getName());
		matchingRecipe.setDateCreated(LocalDate.now());
		matchingRecipe.setActive(true);
		matchingRecipe.setUser(r.getUser()); ///not sure about this - where does USER come from?
		matchingRecipe.setRecipeIngredients(r.getRecipeIngredients()); //?
		matchingRecipe.setCategory(r.getCategory());
		matchingRecipe.setRecipeType(r.getRecipeType());
		matchingRecipe.setPublic(r.isPublic());
		matchingRecipe.setPrepTime(r.getPrepTime());
		matchingRecipe.setInstructions(r.getInstructions());
		matchingRecipe.setPhotoLink(r.getPhotoLink());
		matchingRecipe.setCookbook(r.getCookbook());
		matchingRecipe.setCookbookPageNumber(r.getCookbookPageNumber());
		matchingRecipe.setWebLink(r.getWebLink());
		
		em.persist(matchingRecipe);
		
		em.flush();
		
		return matchingRecipe;
		
	}

	@Override
	public boolean deleteRecipe(Recipe r) {
		//get a match from the database
		Recipe matchingRecipe = em.find(Recipe.class, r.getId());
		
		em.remove(matchingRecipe);
		
		em.flush();
		
		Recipe stillInDB = em.find(Recipe.class, r.getId());
		if(stillInDB == null) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isRecipePublic(int id) {
		String query = "Select r from Recipe where r.isPublic = :public and r.id = :id";

		List<Recipe> results = em.createQuery(query, Recipe.class).setParameter("public", true).setParameter("id", id).getResultList();

		if(results == null) {
			return false;
		}
		else {
			return true;
		}
		
	}

	@Override
	public List<Recipe> selectAllPublicRecipe() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> selectPublicRecipeByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> selectPublicRecipeByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> selectPublicRecipeByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> selectPublicRecipeByIngredient(String ingredient) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> selectPublicRecipeByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> selectPublicRecipeByCookbook(String cookbook) {
		// TODO Auto-generated method stub
		return null;
	}

}
