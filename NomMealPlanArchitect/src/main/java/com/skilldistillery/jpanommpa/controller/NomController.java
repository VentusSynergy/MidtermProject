package com.skilldistillery.jpanommpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpanommpa.dao.AuthenticationDAO;

@Controller
public class NomController {

	@Autowired
	private AuthenticationDAO userDao;

	@RequestMapping(path = "/")
	public String index(Model model) {

		return "index";
	}
	
	
	
	
	@RequestMapping(path = "groceryList.do")
	public String viewGroceryList() {
		
		// Needs work
		
		
		
		return "WEB-INF/groceryList.jsp";
	}
	@RequestMapping(path = "createUser.do")
	public ModelAndView createUser() {
		
		// Needs work
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("WEB-INF/userProfile.jsp");
		
		
		return mv;
	}

}
