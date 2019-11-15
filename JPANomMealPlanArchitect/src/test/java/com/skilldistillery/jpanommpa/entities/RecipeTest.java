package com.skilldistillery.jpanommpa.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.JoinColumn;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class RecipeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Recipe recipe;

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
		recipe = em.find(Recipe.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipe = null;
	}

	@DisplayName("Testing recipe id")
	@Test
	void test() {
//		select *  from recipe where id = 1 \G;
		assertEquals(1, recipe.getId());
		assertEquals("Peanut Butter and Jelly Sandwich", recipe.getName());
		assertEquals("2019-11-14", recipe.getDateCreated().toString());
		assertEquals(true, recipe.isActive());
		assertEquals(true, recipe.isPublic());
		assertEquals("5", recipe.getPrepTime());
		assertTrue(recipe.getInstructions().contains("peanut butter"));
		assertTrue(recipe.getPhotoLink().contains("https"));
		assertEquals("The Bachelor’s Cookbook", recipe.getCookbook());
		assertEquals("1", recipe.getCookbookPageNumber());
		assertEquals("",recipe.getWebLink());
	}
	
	@Test
	@DisplayName ( " test @JoinColumn(name = creator_id")
	void test1() {
		assertEquals(1, recipe.getUser().getId());
	}
	
}
