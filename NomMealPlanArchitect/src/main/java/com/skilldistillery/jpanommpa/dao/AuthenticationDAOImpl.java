package com.skilldistillery.jpanommpa.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.User;

@Transactional
@Service
public class AuthenticationDAOImpl implements AuthenticationDAO {

	@PersistenceContext
	private EntityManager em;

	private Map<String, User> users = new HashMap<>();

	@Override
	public User create(User user) {
		if (isEmailUnique(user.getEmail()) && isUserNameUnique(user.getUsername())) {
			user.setEmail(user.getEmail().toLowerCase());
			user.setUsername(user.getUsername());
			users.put(user.getEmail(), user);
			users.put(user.getUsername(), user);
			user.setActive(true);
			user.setAdmin(false);
			em.persist(user);
			em.flush();
			return user;
		}
		return null;
	}

	@Override
	public boolean isEmailUnique(String email) {
		System.out.println(!users.containsKey(email));
		return !users.containsKey(email);
	}

	@Override
	public boolean isUserNameUnique(String username) {
		System.out.println(!users.containsKey(username));
		return !users.containsKey(username);
	}

	@Override
	public User getUserByEmail(String email) {
		if (users.containsKey(email)) {
			return users.get(email);
		}
		return null;
	}

	@Override
	public boolean isValidUser(User user) {

		System.out.println("************************************");
		System.out.println(user);

		if (getUserByEmail(user.getEmail()) == null) {

			System.out.println("************************************");
			System.out.println(false);

			return false;
		}
		if (users.get(user.getEmail()).getPassword().equals(user.getPassword())) {

			System.out.println("************************************");
			System.out.println(true);

			return true;
		}
		return false;
	}

	@Override
	public User lookUp(String email, String pass) {
		List<User> result = new ArrayList<User>();

		String jpql = "SELECT user FROM User user WHERE email = :email AND password = :pass";
		result = em.createQuery(jpql, User.class).setParameter("email", email).setParameter("pass", pass)
				.getResultList();
		User user = new User();
		user.setFirstName("InvalidUser");
		if (result.size() < 1) {
			result.add(user);
		} else {
			user = result.get(0);
		}

		return user;

	}

	@Override
	public void addUserToMap() {
		String jpql = "SELECT user from User user";
		List<User> result = em.createQuery(jpql, User.class).getResultList();
		System.err.println(result);
		for (int j = 0; j < result.size(); j++) {
			users.put(result.get(j).getEmail(), result.get(j));
			users.put(result.get(j).getUsername(), result.get(j));

		}
		System.out.println(users);
	}

	@Override
	public User updateUser(int id, User updatedUser) {
		User managedUser = em.find(User.class, id);
		
		managedUser.setFirstName(updatedUser.getFirstName());
		managedUser.setLastName(updatedUser.getLastName());
		managedUser.setEmail(updatedUser.getEmail());
		managedUser.setUsername(updatedUser.getUsername());
		
		return managedUser;
	}
}
