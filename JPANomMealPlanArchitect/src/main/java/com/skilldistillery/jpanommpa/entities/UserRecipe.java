package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_recipe")
public class UserRecipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "user_id")
	private int userId;
	@Column(name = "recipe_id")
	private int recipeId;
	@Column(name = "user_favorite")
	private boolean userFavorite;
	private String comment;
	@Column(name = "date_last_made")
	private LocalDate dateLastMade;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	public UserRecipe() {
		super();
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		StringBuilder builder = new StringBuilder();
		builder.append("UserRecipe [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", recipeId=");
		builder.append(recipeId);
		builder.append(", userFavorite=");
		builder.append(userFavorite);
		builder.append(", comment=");
		builder.append(comment);
		builder.append(", dateLastMade=");
		builder.append(dateLastMade);
		builder.append(", user=");
		builder.append(user);
		builder.append("]");
		return builder.toString();
	}

	
}
