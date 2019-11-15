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

class UserRecipeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserRecipe ur;

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
		ur = em.find(UserRecipe.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ur = null;
	}

	@Test
	@DisplayName("testing primary fields")
	void Test2() {
		assertEquals(1, ur.getId());
		assertEquals(1, ur.getRecipeId());
		assertEquals(1, ur.isUserFavorite());
		assertEquals(1, ur.getComment());
		assertEquals(1, ur.getDateLastMade());
	}
//	@Test
//	@DisplayName("testing relationship user_userRecipe")
//	void Test2() {
//		assertEquals(1, ur.getUserId());
//	}

}
