package com.skilldistillery.jpanommpa.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
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

class RecipeReviewTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeReview rr;

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
		rr = em.find(RecipeReview.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		rr = null;
	}

	@Test
	@DisplayName ("testing primary fields not shared")
	void test() {
		assertEquals(1, rr.getId());
		assertEquals(4, rr.getRating());
		assertEquals("2019-11-14", rr.getReviewDate().toString());
		assertTrue(rr.getComment().contains("pretty"));
		assertTrue(rr.isActive());
	}
	
	@Test
	@DisplayName ("testing relationship with User")
	void test1() {
		assertEquals(1, rr.getUser().getId());
	}
	@Test
	@DisplayName ("testing relationship with recipe")
	void test2() {
		assertEquals(1, rr.getRecipe().getId());
		assertEquals("Peanut Butter and Jelly Sandwich", rr.getRecipe().getName());
	}

}
