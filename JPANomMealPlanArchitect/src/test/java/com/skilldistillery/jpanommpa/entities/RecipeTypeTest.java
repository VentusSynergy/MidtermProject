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

class RecipeTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeType rt;

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
		rt = em.find(RecipeType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		rt = null;
	}

	@Test
	void test() {
		fail("Not yet implemented");
	}

}
