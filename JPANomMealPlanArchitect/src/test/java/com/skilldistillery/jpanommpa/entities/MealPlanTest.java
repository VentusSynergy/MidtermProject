package com.skilldistillery.jpanommpa.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class MealPlanTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealPlan mp;

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
		mp = em.find(MealPlan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		mp = null;
	}

	@Test
	@DisplayName ("test the primary fields")
	void test() {
		assertEquals(1, mp.getId());
		assertEquals("Test Plan", mp.getPlanName());
		assertEquals("Test Description", mp.getDescription());
		assertTrue(mp.isActive());
	}
	
	@Test
	@DisplayName ("test the user relationship")
	void test1() {
		assertEquals(1, mp.getUser().getId());
	}
	
	@Test
	@DisplayName ("test the GL_MP relationship")
	void test2() {
		assertEquals("Test Plan", mp.getMealPlanRecipes().get(0).getMealPlan().getPlanName());
	}

}
