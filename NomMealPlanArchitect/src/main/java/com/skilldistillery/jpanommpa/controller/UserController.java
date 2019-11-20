package com.skilldistillery.jpanommpa.controller;

import java.nio.channels.SeekableByteChannel;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpanommpa.dao.AuthenticationDAO;
import com.skilldistillery.jpanommpa.dao.RecipeDAO;
import com.skilldistillery.jpanommpa.dao.UserRecipeFavoritesDAO;
import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.User;
import com.skilldistillery.jpanommpa.entities.UserRecipe;

@Controller
public class UserController {

	@Autowired
	private AuthenticationDAO userDao;

	@Autowired
	private UserRecipeFavoritesDAO favDao;
	
	@RequestMapping(path = "login.do")
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		mv.addObject("user", u);
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(path = "loginAction.do", method = RequestMethod.GET)
	public ModelAndView loginDo(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User user = userDao.lookUp(email, password);
		List<UserRecipe> favList = favDao.selectAllUserRecipe(user.getId());

		if (user.getActive() == false) {
			mv.setViewName("loginDeactive");
			return mv;
		}

		if (user.getFirstName().equalsIgnoreCase("InvalidUser")) {
			mv.setViewName("loginInvalid");
			return mv;
		}

		session.setAttribute("loggedInUser", user);
		mv.addObject("favList", favList);
		mv.addObject("user", user);
		mv.setViewName("userProfile");

		return mv;

	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public ModelAndView logoutDo(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		session.removeAttribute("loggedInUser");

		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		u.setId(0);
		u.setFirstName("");
		u.setLastName("");
		u.setPassword("");
		u.setUsername("");
		u.setEmail("");
		u.setActive(true);
		u.setAdmin(false);

		mv.addObject("user", u);
		mv.setViewName("register");
		return mv;
	}

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String createUser(@Valid User user, Errors errors, HttpSession session) {
		userDao.addUserToMap();

		if (errors.hasErrors()) {
			return "userProfile";
		}

		if (!userDao.isEmailUnique(user.getEmail())) {
			errors.rejectValue("email", "error.email", "Email already in use");
			return "register";
		}
		if (!userDao.isUserNameUnique(user.getUsername())) {
			errors.rejectValue("username", "error.username", "Username already in use");
			return "register";

		}
		System.out.println(user);

		userDao.create(user);

		session.setAttribute("loggedInUser", user);

		return "userProfile";

	}

	@RequestMapping(path = "userProfile.do")
	public ModelAndView userProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
//		User loggedInUser = (User) session.getAttribute("loggedInUser");
//		System.err.println(loggedInUser);
//		List<Recipe> favList = loggedInUser.getRecipes();
//		for (Recipe userRecipe : favList) {
//			System.out.println(userRecipe);
//		}
		
		mv.setViewName("userProfile");
		return mv;
	}

	@RequestMapping(path = "getUserProfile.do", method = RequestMethod.GET)
	public ModelAndView userUpdate(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User userToUpdate = (User) session.getAttribute("loggedInUser");

		mv.addObject("user", userToUpdate);
		mv.setViewName("updateProfile");
		return mv;
	}

	@RequestMapping(path = "updateUserProfile.do", params = "userId", method = RequestMethod.POST)
	public ModelAndView updateUserProfile(@RequestParam("userId") int userId, @Valid User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User display = userDao.updateUser(userId, user);

		session.setAttribute("loggedInUser", display);

		mv.setViewName("userProfile");
		return mv;
	}

	@RequestMapping(path = "deactivateUser.do", params = "userId", method = RequestMethod.POST)
	public ModelAndView deactivateUser(@RequestParam("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		userDao.updateActiveStatus(userId);

		session.removeAttribute("loggedInUser");

		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(path = "removeFav.do", params = "id", method = RequestMethod.POST)
	public ModelAndView removeFavRecipe(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		favDao.deleteUserRecipe(id);
		
		
		mv.setViewName("userProfile");
		return mv;
	}

}
