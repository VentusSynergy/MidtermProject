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
@Table(name = "recipe_review")
public class RecipeReview {

//	+-------------+------------+------+-----+---------+----------------+
//	| Field       | Type       | Null | Key | Default | Extra          |
//	+-------------+------------+------+-----+---------+----------------+
//	| id          | int(11)    | NO   | PRI | NULL    | auto_increment |
//	| user_id     | int(11)    | NO   | MUL | NULL    |                |
//	| recipe_id   | int(11)    | NO   | MUL | NULL    |                |
//	| rating      | int(1)     | NO   |     | NULL    |                |
//	| review_date | date       | NO   |     | NULL    |                |
//	| comment     | text       | YES  |     | NULL    |                |
//	| active      | tinyint(4) | YES  |     | 1       |                |
//	+-------------+------------+------+-----+---------+----------------+
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "recipe_id")
	private int recipeId;
	private int rating;
	@Column(name = "review_date")
	private LocalDate reviewDate;
	private String comment;
	private boolean active;

	public RecipeReview() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		RecipeReview other = (RecipeReview) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RecipeReview [id=" + id + ", user=" + user + ", recipeId=" + recipeId + ", rating=" + rating
				+ ", reviewDate=" + reviewDate + ", comment=" + comment + ", active=" + active + "]";
	}

}
