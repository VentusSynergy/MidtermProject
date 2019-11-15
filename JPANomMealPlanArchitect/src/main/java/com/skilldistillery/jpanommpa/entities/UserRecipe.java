package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserRecipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int userId;
	private int recipeId;
	private boolean userFavorite;
	private String comment;
	private LocalDate dateLastMade;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public UserRecipe() {
		super();
	}

	public User getUser() {
		return user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public boolean isUserFavorite() {
		return userFavorite;
	}

	public void setUserFavorite(boolean userFavorite) {
		this.userFavorite = userFavorite;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDate getDateLastMade() {
		return dateLastMade;
	}

	public void setDateLastMade(LocalDate dateLastMade) {
		this.dateLastMade = dateLastMade;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserRecipe other = (UserRecipe) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserRecipe [id=" + id + ", userId=" + userId + ", recipeId=" + recipeId + ", userFavorite="
				+ userFavorite + ", comment=" + comment + ", dateLastMade=" + dateLastMade + ", user=" + user + "]";
	}
}
