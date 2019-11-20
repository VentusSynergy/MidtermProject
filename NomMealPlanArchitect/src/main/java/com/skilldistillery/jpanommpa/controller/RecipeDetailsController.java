package com.skilldistillery.jpanommpa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpanommpa.dao.RecipeDAO;
import com.skilldistillery.jpanommpa.dao.RecipeReviewDAO;
import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.RecipeReview;

@Controller
public class RecipeDetailsController {

	@Autowired
	private RecipeDAO recipeDao;

	@Autowired
	private RecipeReviewDAO reviewDao;

	@RequestMapping(path = "searchOneRecipe.do", method = RequestMethod.GET)
	public ModelAndView searchOneRecipes(@RequestParam("recipeId") int id) {
		ModelAndView mv = new ModelAndView();
		Recipe recipe = recipeDao.selectRecipeById(id);
		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}

	@RequestMapping(path = "review.do", method = RequestMethod.POST)
	public ModelAndView addReview(@ModelAttribute("newReview") RecipeReview newReview) {
		ModelAndView mv = new ModelAndView();
		reviewDao.createRecipeReview(newReview);
		Recipe recipe = recipeDao.selectRecipeById(newReview.getRecipe().getId());
		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}

}
