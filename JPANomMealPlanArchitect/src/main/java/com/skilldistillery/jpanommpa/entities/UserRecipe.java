package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDate;

public class UserRecipe {
	private int id;
	private int userId;
	private int recipeId;
	private boolean userFavorite;
	private String comment;
	private LocalDate dateLastMade;

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
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((dateLastMade == null) ? 0 : dateLastMade.hashCode());
		result = prime * result + id;
		result = prime * result + recipeId;
		result = prime * result + (userFavorite ? 1231 : 1237);
		result = prime * result + userId;
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
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (dateLastMade == null) {
			if (other.dateLastMade != null)
				return false;
		} else if (!dateLastMade.equals(other.dateLastMade))
			return false;
		if (id != other.id)
			return false;
		if (recipeId != other.recipeId)
			return false;
		if (userFavorite != other.userFavorite)
			return false;
		if (userId != other.userId)
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
		builder.append("]");
		return builder.toString();
	}
}
