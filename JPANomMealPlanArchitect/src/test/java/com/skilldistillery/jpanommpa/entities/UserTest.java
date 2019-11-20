package com.skilldistillery.jpanommpa.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);

	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("testing primary fields")
	void test() {
//		select * from user where id = 1;
		assertNotNull(user.getUsername());
		assertEquals("marthaStewart", user.getUsername());
		assertEquals("marthastewart@gmail.com", user.getEmail());
		assertEquals("marthaStewart", user.getPassword());
		assertEquals("Martha", user.getFirstName());
		assertEquals("Stewart", user.getLastName());
		assertEquals(true, user.getActive());
		assertEquals(false, user.getAdmin());
		assertNull(user.getDateCreated());
		assertNull(user.getDateUpdated());
		assertEquals("https://i.imgur.com/FBJi16J.jpg", user.getAvatarURL());
	}

	@Test
	@DisplayName("testing relationship user and Recipe")
	void test3() {
		assertEquals(1, user.getRecipes().get(0).getUser().getId());
	}
	
	@Test
	@DisplayName("testing relationship user and RecipeReview ")
	void test4() {
		assertEquals(1, user.getRecipeReview().get(0).getId());
	}
	@Test
	@DisplayName("testing relationship user and Meal Plan")
	void test5() {
		assertEquals(1, user.getMealPlans().get(0).getId());
	}

}
