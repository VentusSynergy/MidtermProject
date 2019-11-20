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

	private int rating;
	@Column(name = "review_date")
	private LocalDate reviewDate;
	private String comment;
	private boolean active;
	
	@ManyToOne
	@JoinColumn(name = "recipe_id")
	private Recipe recipe;

	public RecipeReview() {
		super();
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		StringBuilder builder = new StringBuilder();
		builder.append("RecipeReview [id=");
		builder.append(id);
		builder.append(", user=");
		builder.append(user);
		builder.append(", rating=");
		builder.append(rating);
		builder.append(", reviewDate=");
		builder.append(reviewDate);
		builder.append(", comment=");
		builder.append(comment);
		builder.append(", active=");
		builder.append(active);
		builder.append(", recipe=");
		builder.append(recipe);
		builder.append("]");
		return builder.toString();
	}

}
