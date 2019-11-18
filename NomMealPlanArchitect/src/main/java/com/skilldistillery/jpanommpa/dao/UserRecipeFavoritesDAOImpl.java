package com.skilldistillery.jpanommpa.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.UserRecipe;
@Transactional
@Service
public class UserRecipeFavoritesDAOImpl implements UserRecipeFavoritesDAO{
	@PersistenceContext
	EntityManager em;

	@Override
	public UserRecipe createUserRecipe(UserRecipe ur) {
		em.persist(ur);
		
		em.flush();
		
		return ur;
	}

	@Override
	public UserRecipe updateUserRecipe(UserRecipe ur) {
		UserRecipe matchingUR = em.find(UserRecipe.class, ur.getId());

		matchingUR.setUser(ur.getUser());
		matchingUR.setRecipe(ur.getRecipe());
		matchingUR.setUserFavorite(true);
		matchingUR.setComment(ur.getComment());
		matchingUR.setDateLastMade(ur.getDateLastMade());
		

		em.persist(matchingUR);

		em.flush();

		return matchingUR;
	}

	@Override
	public boolean deleteUserRecipe(UserRecipe ur) {
		UserRecipe matchingUR = em.find(UserRecipe.class, ur.getId());
		
		matchingUR.setUserFavorite(false);
		
		em.persist(ur);
		
		em.flush();

		return true;
	}

	@Override
	public List<UserRecipe> selectAllUserRecipe() {
		String query = "Select u from UserRecipe u";

		List<UserRecipe> results = em.createQuery(query, UserRecipe.class).getResultList();

		return results;
	}

	@Override
	public List<UserRecipe> selectUserRecipeByRecipeName(String name) {
		String query = "Select u from UserRecipe u where u.recipe.name like :name";

		List<UserRecipe> results = em.createQuery(query, UserRecipe.class).setParameter("name", "%" + name + "%").getResultList();

		return results;
	}

	@Override
	public List<UserRecipe> selectUserRecipeByDateLastMade(LocalDate date) {
		String query = "Select u from UserRecipe u where u.dateLastMade = :date";

		List<UserRecipe> results = em.createQuery(query, UserRecipe.class).setParameter("date", date).getResultList();

		return results;
	}

}
