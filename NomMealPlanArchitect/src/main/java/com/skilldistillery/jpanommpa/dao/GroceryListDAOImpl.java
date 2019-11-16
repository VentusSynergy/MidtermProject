package com.skilldistillery.jpanommpa.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.GroceryList;

@Transactional
@Service
public class GroceryListDAOImpl implements GroceryListDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public GroceryList createGroceryList(GroceryList g) {
		em.persist(g);

		em.flush();

		return g;

	}

	@Override
	public GroceryList updateGroceryList(GroceryList g) {
		GroceryList matchingGL = em.find(GroceryList.class, g.getId());

		matchingGL.setPurchased(g.isPurchased());

		em.persist(matchingGL);

		em.flush();

		return matchingGL;
	}

	@Override
	public boolean deleteGroceryList(GroceryList g) {
		GroceryList matchingGroceryList = em.find(GroceryList.class, g.getId());
		
		em.remove(matchingGroceryList);
		
		em.flush();
		
		GroceryList stillInDB = em.find(GroceryList.class, g.getId());
		if (stillInDB == null) {
			return true;
		} else {
			return false;
		}

	}

}
