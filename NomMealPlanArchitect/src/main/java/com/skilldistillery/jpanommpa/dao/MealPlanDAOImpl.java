package com.skilldistillery.jpanommpa.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpanommpa.entities.MealPlan;

@Transactional
@Service
public class MealPlanDAOImpl implements MealPlanDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public MealPlan createMealPlan(MealPlan m) {
		em.persist(m);

		em.flush();

		return m;
	}

	@Override
	public MealPlan updateMealPlan(MealPlan m) {
		MealPlan matchingMP = em.find(MealPlan.class, m.getId());

		matchingMP.setUser(m.getUser());
		matchingMP.setPlanName(m.getPlanName());
		matchingMP.setDescription(m.getDescription());
		matchingMP.setActive(true);

		em.persist(m);

		em.flush();

		return m;
	}

	@Override
	public boolean deleteMealPlan(MealPlan m) {
		MealPlan matchingMP = em.find(MealPlan.class, m.getId());

		matchingMP.setActive(false);
		
		em.persist(matchingMP);

		em.flush();

		return true;
	}

	@Override
	public List<MealPlan> selectAllMealPlan(MealPlan m) {
		String query = "Select m from MealPlan m";

		List<MealPlan> results = em.createQuery(query, MealPlan.class).getResultList();

		return results;
	}

	@Override
	public List<MealPlan> selectMealPlanByKeyword(String keyword) {
		String query = "Select m from MealPlan m where planName like :word or description like :word";

		List<MealPlan> results = em.createQuery(query, MealPlan.class).setParameter("word", "%" + keyword + "%").getResultList();

		return results;
	}

}
