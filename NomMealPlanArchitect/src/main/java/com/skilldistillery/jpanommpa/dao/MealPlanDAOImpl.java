package com.skilldistillery.jpanommpa.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.MealPlan;

@Transactional
@Service
public class MealPlanDAOImpl implements MealPlanDAO{
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public MealPlan createMealPlan(MealPlan m) {
		return null;
	}

	@Override
	public MealPlan updateMealPlan(MealPlan m) {
		em.persist(m);
		
		return null;
	}

	@Override
	public boolean deleteMealPlan(MealPlan m) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MealPlan selectAllMealPlan(MealPlan m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MealPlan selectMealPlanByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
