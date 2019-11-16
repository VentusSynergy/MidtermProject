package com.skilldistillery.jpanommpa.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpanommpa.dao.AuthenticationDAO;
import com.skilldistillery.jpanommpa.dao.GroceryListDAO;
import com.skilldistillery.jpanommpa.dao.IngredientDAO;
import com.skilldistillery.jpanommpa.dao.MealPlanDAO;
import com.skilldistillery.jpanommpa.dao.RecipeDAO;
import com.skilldistillery.jpanommpa.entities.User;

@Controller
public class NomController {

	@Autowired
	private AuthenticationDAO userDao;
	@Autowired
	private GroceryListDAO groceryDao;
	@Autowired
	private IngredientDAO ingredientDao;
	@Autowired
	private MealPlanDAO mealPlanDao;
	@Autowired
	private RecipeDAO recipeDao;

	@RequestMapping(path = "/")
	public String index(Model model) {

		return "index";
	}

	@RequestMapping(path = "index.do")
	public String indexDo(Model model) {

		return "index";
	}

	@RequestMapping(path = "groceryList.do")
	public ModelAndView viewGroceryList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// Needs work

		return mv;
	}

	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		mv.addObject("user", u);
		mv.setViewName("register");
		return mv;
	}

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String createUser(@Valid User user, Errors errors) {

		if (errors.hasErrors()) {
			return "userProfile";
		}

		if (!userDao.isEmailUnique(user.getEmail())) {
			errors.rejectValue("email", "error.email", "Email already in use");
			return "register";
		}

		userDao.create(user);

		return "userProfile";

	}

}
