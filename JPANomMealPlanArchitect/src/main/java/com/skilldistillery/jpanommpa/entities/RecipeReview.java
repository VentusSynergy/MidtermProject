package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class RecipeReview {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int userId;
	private int recipeId;
	private int rating;
	private LocalDate reviewDate;
	private String comment;
	private boolean active;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public RecipeReview() {
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

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public LocalDate getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(LocalDate reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
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
		RecipeReview other = (RecipeReview) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RecipeReview [id=" + id + ", userId=" + userId + ", recipeId=" + recipeId + ", rating=" + rating
				+ ", reviewDate=" + reviewDate + ", comment=" + comment + ", active=" + active + ", user=" + user + "]";
	}

}
