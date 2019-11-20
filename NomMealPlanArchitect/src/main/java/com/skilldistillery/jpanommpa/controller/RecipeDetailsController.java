package com.skilldistillery.jpanommpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpanommpa.dao.CategoryDAO;
import com.skilldistillery.jpanommpa.dao.GroceryListDAO;
import com.skilldistillery.jpanommpa.dao.IngredientDAO;
import com.skilldistillery.jpanommpa.dao.MealPlanDAO;
import com.skilldistillery.jpanommpa.dao.RecipeDAO;
import com.skilldistillery.jpanommpa.dao.TypeDAO;
import com.skilldistillery.jpanommpa.dao.UserRecipeFavoritesDAO;
import com.skilldistillery.jpanommpa.entities.Recipe;

@Controller
public class RecipeDetailsController {

	
	@Autowired
	private GroceryListDAO groceryDao;
	@Autowired
	private IngredientDAO ingredientDao;
	@Autowired
	private MealPlanDAO mealPlanDao;
	@Autowired
	private RecipeDAO recipeDao;
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private TypeDAO typeDao;
	@Autowired
	private UserRecipeFavoritesDAO favDao;
	
	@RequestMapping(path = "searchOneRecipe.do", method = RequestMethod.GET)
	public ModelAndView searchOneRecipes(@RequestParam("recipeId") int id) {
		ModelAndView mv = new ModelAndView();
		Recipe recipe = recipeDao.selectRecipeById(id);
		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}
	
	
	@RequestMapping(path = "review.do", method = RequestMethod.GET)
	public ModelAndView addReview(@RequestParam("recipeId") int id) {
		ModelAndView mv = new ModelAndView();
		
		
		
		
		
		Recipe recipe = recipeDao.selectRecipeById(id);
		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}
	
	
	
	
}
