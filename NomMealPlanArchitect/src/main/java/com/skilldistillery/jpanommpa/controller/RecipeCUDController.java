package com.skilldistillery.jpanommpa.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.jpanommpa.dao.CategoryDAO;
import com.skilldistillery.jpanommpa.dao.GroceryListDAO;
import com.skilldistillery.jpanommpa.dao.IngredientDAO;
import com.skilldistillery.jpanommpa.dao.RecipeDAO;
import com.skilldistillery.jpanommpa.dao.RecipeReviewDAO;
import com.skilldistillery.jpanommpa.dao.TypeDAO;
import com.skilldistillery.jpanommpa.dao.UserRecipeFavoritesDAO;
import com.skilldistillery.jpanommpa.entities.Ingredient;
import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.RecipeIngredient;
import com.skilldistillery.jpanommpa.entities.User;
import com.skilldistillery.jpanommpa.entities.UserRecipe;

@Controller
public class RecipeCUDController {

	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private IngredientDAO ingredientDao;
	@Autowired
	private RecipeDAO recipeDao;
	@Autowired
	private TypeDAO typeDao;

	
	@RequestMapping(path = "createRecipe.do", method = RequestMethod.GET)
	public ModelAndView createRecipe(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = (User) session.getAttribute("loggedInUser");
		mv.addObject("categories", categoryDao.selectAllCategories());
		mv.addObject("types", typeDao.selectAllRecipeTypes());
		mv.addObject("ingredients", ingredientDao.selectAllIngredientObjects());
		mv.addObject("user", u);
		mv.addObject("date", LocalDate.now());
		mv.setViewName("createRecipe");
		return mv;
	}

	@RequestMapping(path = "recipeCreate.do", method = RequestMethod.POST)
	public ModelAndView AddRecipe(@Valid Recipe recipe, Integer[] ingredientIds, HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		recipe.setUser((User) session.getAttribute("loggedInUser"));
		RecipeIngredient[] ri = new RecipeIngredient[ingredientIds.length+1];

		for (int i = 0; i < ingredientIds.length; i++) {
			if (ingredientIds[i] != null) {
				Ingredient ing = ingredientDao.selectIngredientById(ingredientIds[i]);
				RecipeIngredient riToAdd = new RecipeIngredient();

				ri[i] = riToAdd;

				ri[i].setIngredient(ing);
				ri[i].setQuantity(1);
			} else {
				break;
			}
		}
		
		Recipe created = recipeDao.createRecipe(recipe, ri);
		if (created != null) {
			List<Recipe> recipeList = new ArrayList<>();
			recipeList.add(created);
			mv.addObject("recipe", recipeList);
			mv.setViewName("recipeSearchResult");
		} else {
			mv.addObject("createStatus", true);
			mv.setViewName("createRecipe");
		}

		return mv;
	}

	@RequestMapping(path = "updateRecipe.do", method = RequestMethod.GET)
	public ModelAndView updateRecipe(@RequestParam("recipeId") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = (User) session.getAttribute("loggedInUser");
		Recipe toUpdate = recipeDao.selectRecipeById(id);
		mv.addObject("user", u);
		mv.addObject("ingredients", ingredientDao.selectAllIngredientObjects());
		List<RecipeIngredient> inRecipe = recipeDao.selectRecipeById(id).getRecipeIngredients();
		List<Ingredient> ingInRecipe = new ArrayList<Ingredient>();
		for (RecipeIngredient recipeIngredient : inRecipe) {
			ingInRecipe.add(recipeIngredient.getIngredient());
		}
		mv.addObject("categories", categoryDao.selectAllCategories());
		mv.addObject("types", typeDao.selectAllRecipeTypes());
		mv.addObject("ingredientsIN", ingInRecipe);
		mv.addObject("recipe", toUpdate);
		mv.setViewName("updateRecipe");
		return mv;
	}

	@RequestMapping(path = "recipeUpdate.do", method = RequestMethod.POST)
	public ModelAndView UpdateRecipe(@Valid Recipe recipe, Integer[] ingredientIds, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		RecipeIngredient[] ri = new RecipeIngredient[ingredientIds.length+1];

		for (int i = 0; i < ingredientIds.length; i++) {
			if (ingredientIds[i] != null) {
				Ingredient ing = ingredientDao.selectIngredientById(ingredientIds[i]);
				RecipeIngredient riToAdd = new RecipeIngredient();

				ri[i] = riToAdd;

				ri[i].setIngredient(ing);
				ri[i].setQuantity(1);
			} else {
				break;
			}
		}
		
		Recipe updated = recipeDao.updateRecipe(recipe, ri);
		// return same search
		List<Recipe> recipeList = recipeDao.selectRecipeByName(updated.getName());
		mv.addObject("recipe", recipeList);
		mv.setViewName("recipeSearchResult");
		return mv;
	}

	@RequestMapping(path = "deleteRecipe.do", method = RequestMethod.POST)
	public ModelAndView deleteRecipe(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		UserRecipe ur = new UserRecipe();
		ur.setUser(user);
		recipeDao.deleteRecipe(recipeDao.selectRecipeById(id));
		// return same search
		List<Recipe> recipeList = recipeDao.selectAllRecipe();
		mv.addObject("recipe", recipeList);
		mv.setViewName("recipeSearchResult");
		return mv;
	}
	
}
