package com.skilldistillery.jpanommpa.entities;

import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class MealPlanRecipeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealPlanRecipe mpr;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("VideoStore");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		mpr = em.find(MealPlanRecipe.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		mpr = null;
	}

	@Test
	void test() {
		fail("Not yet implemented");
	}

}
