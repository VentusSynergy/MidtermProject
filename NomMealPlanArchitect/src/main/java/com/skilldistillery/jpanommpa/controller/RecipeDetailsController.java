package com.skilldistillery.jpanommpa.controller;

import java.util.List;

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
import com.skilldistillery.jpanommpa.dao.UserRecipeFavoritesDAO;
import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.RecipeReview;
import com.skilldistillery.jpanommpa.entities.User;
import com.skilldistillery.jpanommpa.entities.UserRecipe;

@Controller
public class RecipeDetailsController {

	@Autowired
	private RecipeDAO recipeDao;
	@Autowired
	private RecipeReviewDAO reviewDao;
	@Autowired
	private UserRecipeFavoritesDAO favDao;

	@RequestMapping(path = "searchOneRecipe.do", method = RequestMethod.GET)
	public ModelAndView searchOneRecipes(@RequestParam("recipeId") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Recipe recipe = recipeDao.selectRecipeById(id);

		User user = (User) session.getAttribute("loggedInUser");

		if (user != null) {
			List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());
			mv.addObject("favList", favList);
		}

		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}

	@RequestMapping(path = "searchOneRecipePost.do", method = RequestMethod.POST)
	public ModelAndView searchOneRecipesPost(@RequestParam("recipeId") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Recipe recipe = recipeDao.selectRecipeById(id);

		User user = (User) session.getAttribute("loggedInUser");
		UserRecipe ur = new UserRecipe();
		ur.setUser(user);
		ur.setRecipe(recipeDao.selectRecipeById(id));
		favDao.createUserRecipe(ur);
		List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());
		mv.addObject("favList", favList);

		int num = 5;
		mv.addObject("averageRating", num);

		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}

	@RequestMapping(path = "review.do", method = RequestMethod.POST)
	public ModelAndView addReview(@ModelAttribute("newReview") RecipeReview newReview, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User user = (User) session.getAttribute("loggedInUser");
		List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());
		mv.addObject("favList", favList);

		reviewDao.createRecipeReview(newReview);
		Recipe recipe = recipeDao.selectRecipeById(newReview.getRecipe().getId());
		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}

	@RequestMapping(path = "reviewDeactivate.do", method = RequestMethod.POST)
	public ModelAndView reviewDeactivate(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		RecipeReview deactivateReview = reviewDao.findReviewById(id);

		User user = (User) session.getAttribute("loggedInUser");
		List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());
		mv.addObject("favList", favList);

		reviewDao.deleteRecipeReview(deactivateReview);
		Recipe recipe = recipeDao.selectRecipeById(deactivateReview.getRecipe().getId());

		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}

}
