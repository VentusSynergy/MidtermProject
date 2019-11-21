package com.skilldistillery.jpanommpa.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.skilldistillery.jpanommpa.entities.Ingredient;
import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.RecipeIngredient;
import com.skilldistillery.jpanommpa.entities.User;
import com.skilldistillery.jpanommpa.entities.UserRecipe;

@Controller
public class NomController {

//	@Autowired
//	private AuthenticationDAO userDao;
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

	@RequestMapping(path = { "/", "index.do" })
	public String index(Model model) {

		return "index";
	}

	@RequestMapping(path = "recipeSearch.do", method = RequestMethod.GET)
	public ModelAndView searchRecipe() {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		mv.addObject("user", u);
		mv.addObject("recipeIngredient", ingredientDao.selectAllIngredient());
		mv.addObject("recipeCategory", categoryDao.selectAllCategories());
		mv.addObject("recipeTypes", typeDao.selectAllRecipeTypes());

		mv.setViewName("recipeSearch");
		return mv;
	}

	@RequestMapping(path = "searchRecipe.do", method = RequestMethod.GET)
	public ModelAndView searchRecipeResults(@RequestParam("key") String key, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User userFake = new User();
		userFake.setFirstName("");
		userFake.setLastName("");
		userFake.setActive(false);

		userFake.setAdmin(false);
		userFake.setEmail("");
		userFake.setUsername("");
		userFake.setPassword("");
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			user = userFake;
		}

		List<Recipe> recipeList = new ArrayList<>();
		// if there is a logged-in user,
		// get ALL recipes by name
		// also get a list of user-fav recipes
		if (user.getEmail().length() > 0) {
			recipeList = recipeDao.selectRecipeByName(key);
			List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());
			mv.addObject("favList", favList);
		}
		// otherwise, only get public recipes
		// get no fav-recipes
		else {
			recipeList = recipeDao.selectRecipeByName(key);
		}
		mv.addObject("recipe", recipeList);
		mv.addObject("key", key);
		mv.setViewName("recipeSearchResult");
		return mv;
	}

	@RequestMapping(path = "recipeByIngredient.do", method = RequestMethod.GET)
	public ModelAndView searchRecipeByIngredient(@RequestParam("ingredient") String ingredient) {
		ModelAndView mv = new ModelAndView();
		List<Recipe> recipeList = recipeDao.selectRecipeByIngredient(ingredient);
		mv.addObject("recipe", recipeList);
		mv.setViewName("recipeSearchResult");
		return mv;
	}

	@RequestMapping(path = "recipeByCategory.do", method = RequestMethod.GET)
	public ModelAndView searchRecipeByCategory(@RequestParam("category") String category) {
		ModelAndView mv = new ModelAndView();
		List<Recipe> recipeList = recipeDao.selectRecipeByCategory(category);
		mv.addObject("category", category);
		mv.addObject("recipe", recipeList);
		mv.setViewName("recipeSearchResult");
		return mv;
	}

	@RequestMapping(path = "recipeByType.do", method = RequestMethod.GET)
	public ModelAndView searchRecipeByType(@RequestParam("type") String type) {
		ModelAndView mv = new ModelAndView();
		List<Recipe> recipeList = recipeDao.selectRecipeByType(type);
		mv.addObject("recipe", recipeList);
		mv.addObject("type", type);
		mv.setViewName("recipeSearchResult");
		return mv;
	}

	@RequestMapping(path = "searchAllRecipes.do", method = RequestMethod.GET)
	public ModelAndView searchALLRecipes() {
		ModelAndView mv = new ModelAndView();
		List<Recipe> recipeList = recipeDao.selectAllRecipe();
		mv.addObject("recipe", recipeList);
		mv.setViewName("recipeSearchResult");
		return mv;
	}

//	@RequestMapping(path = "searchOneRecipe.do", method = RequestMethod.GET)
//	public ModelAndView searchOneRecipes(@RequestParam("recipeId") int id) {
//		ModelAndView mv = new ModelAndView();
//		Recipe recipe = recipeDao.selectRecipeById(id);
//		mv.addObject("recipe", recipe);
//		mv.setViewName("recipeDetails");
//		return mv;
//	}

	@RequestMapping(path = "groceryList.do")
	public ModelAndView viewGroceryList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		mv.addObject("user", u);
//		TODO needs grocery list to function

		mv.setViewName("groceryList");
		return mv;
	}

	@RequestMapping(path = "addRecipeToUser.do", method = RequestMethod.POST)
	public ModelAndView addRecipeToUser(@RequestParam("id") int id, @RequestParam("key") String key,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		UserRecipe ur = new UserRecipe();
		ur.setUser(user);
		ur.setRecipe(recipeDao.selectRecipeById(id));
		favDao.createUserRecipe(ur);
		List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());
		mv.addObject("favList", favList);

		// return same search
		List<Recipe> recipeList = recipeDao.selectRecipeByName(key);
		mv.addObject("recipe", recipeList);
		mv.addObject("key", key);
		mv.setViewName("recipeSearchResult");
		return mv;
	}

	@RequestMapping(path = "addToRecipeDetail.do", method = RequestMethod.POST)
	public ModelAndView addToRecipeDetail(@RequestParam("id") int id, @RequestParam("key") String key,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		UserRecipe ur = new UserRecipe();
		ur.setUser(user);
		ur.setRecipe(recipeDao.selectRecipeById(id));
		favDao.createUserRecipe(ur);
		List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());
		mv.addObject("favList", favList);

		// return same search
		Recipe recipe = recipeDao.selectRecipeById(id);

		int num = 5;
		mv.addObject("averageRating", num);
		mv.addObject("recipe", recipe);
		mv.setViewName("recipeDetails");
		return mv;
	}
}
