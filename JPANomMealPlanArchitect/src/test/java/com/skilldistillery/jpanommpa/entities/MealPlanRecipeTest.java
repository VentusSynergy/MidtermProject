package com.skilldistillery.jpanommpa.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class MealPlanRecipeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealPlanRecipe mpr;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("NomMPA");
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
	@DisplayName("testing eneity fields")
	void test() {
		assertEquals(1, mpr.getId());
		assertEquals(1, mpr.getSequenceNumber());
		assertEquals(Days.Sunday, mpr.getDay());
	}

	@Test
	@DisplayName("testing mealPlanRecipe_recipe relationship")
	void test2() {
		// select * from meal_plan_recipe mpr join recipe r on r.type_id = mpr.recipe_id
		// where r.id = 1;
		assertEquals(2, mpr.getRecipe().getId());
		assertEquals("Spaghetti ", mpr.getRecipe().getName());
	}

	@Test
	@DisplayName("testing mealPlanRecipe_mealPlan relationship")
	void test3() {
		assertEquals("Test Plan", mpr.getMealPlan().getPlanName());
	}

	@Test
	@DisplayName("testing mealPlanRecipe_types relationship")
	void test4() {
		assertEquals("Breakfast", mpr.getType().getName());
	}

}
