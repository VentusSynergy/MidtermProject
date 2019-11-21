package com.skilldistillery.jpanommpa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpanommpa.dao.MealPlanDAO;
import com.skilldistillery.jpanommpa.entities.MealPlan;
import com.skilldistillery.jpanommpa.entities.User;

@Controller
public class MealPlanController {

	@Autowired
	MealPlanDAO mpDao;

	@RequestMapping(path = "mealPlan.do")
	public ModelAndView mealPlan(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.err.println("Before sent in Impl");

		User userPlan = (User) session.getAttribute("loggedInUser");
		List<MealPlan> mp = mpDao.selectMealPlanByUser(userPlan);

		System.err.println("Before sent in controller");
		mv.addObject("mealPlan", mp);

		mv.setViewName("mealPlan");

		return mv;
	}

}
