package com.skilldistillery.jpanommpa.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.hibernate.validator.internal.util.privilegedactions.GetInstancesFromServiceLoader;
import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.Ingredient;
import com.skilldistillery.jpanommpa.entities.Recipe;
import com.skilldistillery.jpanommpa.entities.User;


@Transactional
@Service
public class AuthenticationDAOImpl implements AuthenticationDAO {

	@PersistenceContext
	private EntityManager em;

	private Map<String, User> users = new HashMap<>();

	@Override
	public User create(User user) {
//		if (isEmailUnique(user.getEmail())) {
//			users.put(user.getEmail(), user);
//			em.persist(user);
//			em.flush();
//			return user;
//		}
		return null;
	}

	@Override
	public boolean isEmailUnique(String email) {
		return !users.containsKey(email);
	}

	@Override
	public User getUserByEmail(String email) {
		if (users.containsKey(email)) {
			return users.get(email);
		}
		return null;
	}

	@Override
	public boolean isValidUser(User u) {
		if (getUserByEmail(u.getEmail()) == null) {
//			return false;
//		}
//		if (users.get(u.getEmail()).getPassword().equals(u.getPassword())) {
//			return true;
//		}
		return false;
	}

	@Override
	public Recipe create(Recipe recipe) {
		em.persist(recipe);
        em.flush();
		return recipe;
	}

	@Override
	public List<Recipe> showAll() {
		String sql = "";
		
		List<Recipe> result = null;
		return result;
	}

	@Override
	public Ingredient create(Ingredient ing) {
		if()
		return null;
	}
	
}
