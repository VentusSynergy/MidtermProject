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

class IngredientTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Ingredient ing;

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
		ing = em.find(Ingredient.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ing = null;
	}

	@DisplayName("Testing Ingredient id field")
	@Test
	void test1() {
		assertEquals(1, ing.getId());
	}
	@DisplayName("Testing Ingredient name field")
	@Test
	void test2() {
		assertEquals("Sandwich Bread", ing.getName());
	}
//	@DisplayName("Testing Ingredient brand field")
//	@Test
//	void test3() {
//		assertEquals(expected, actual);
//		id 1 brand is null
//	}
//	@DisplayName("Testing Ingredient size field")
//	@Test
//	void test4() {
//		assertEquals(expected, actual);
//		id 1 size is null
//
//	}
//	@DisplayName("Testing Ingredient category field")
//	@Test
//	void test5() {
//		assertEquals(expected, actual);
//	}

}
