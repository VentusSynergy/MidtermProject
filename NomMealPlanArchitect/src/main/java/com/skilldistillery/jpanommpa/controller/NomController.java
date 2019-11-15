package com.skilldistillery.jpanommpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpanommpa.dao.AuthenticationDAO;

@Controller
public class NomController {

	@Autowired
	private AuthenticationDAO userDao;

	@RequestMapping(path = "/")
	public String index(Model model) {

		return "index";
	}

}
