package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import com.skilldistillery.jpanommpa.entities.RecipeReview;

public interface RecipeReviewDAO {
	public RecipeReview createRecipeReview(RecipeReview r);

	public RecipeReview updateRecipeReview(RecipeReview r);

	public boolean deleteRecipeReview(RecipeReview r);

	public List<RecipeReview> selectAllRecipeReview();

	public List<RecipeReview> selectRecipeReviewByUserID(int id);

	public List<RecipeReview> selectRecipeReviewByRating(int rating);

	public List<RecipeReview> selectRecipeReviewByRecipeID(int id);

	public List<RecipeReview> selectRecipeReviewByRecipeName(String recipeName);

	public RecipeReview findReviewById(int id);
}
