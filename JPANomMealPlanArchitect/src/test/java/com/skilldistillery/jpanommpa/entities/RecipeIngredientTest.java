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

class RecipeIngredientTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeIngredient ri;

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
		ri = em.find(RecipeIngredient.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ri = null;
	}

	@Test
	@DisplayName("testing recipe_recipeIngedient relationship")
	void test() {
		assertEquals("Peanut Butter and Jelly Sandwich", ri.getRecipe().getName());
	}
	@Test
	@DisplayName("testing ingredient_recipeIngedient relationship")
	void test2() {
		assertEquals("Sandwich Bread", ri.getIngredient().getName());
	}

}
