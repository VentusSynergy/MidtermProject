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

//	+----------------+------------+------+-----+---------+----------------+
//	| Field          | Type       | Null | Key | Default | Extra          |
//	+----------------+------------+------+-----+---------+----------------+
//	| id             | int(11)    | NO   | PRI | NULL    | auto_increment |
//	| user_id        | int(11)    | NO   | MUL | NULL    |                |
//	| recipe_id      | int(11)    | NO   | MUL | NULL    |                |
//	| user_favorite  | tinyint(4) | YES  |     | 0       |                |
//	| comment        | text       | YES  |     | NULL    |                |
//	| date_last_made | date       | YES  |     | NULL    |                |
//	+----------------+------------+------+-----+---------+----------------+

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name = "recipe_id")
	private int recipeId;

	@Column(name = "user_favorite")
	private boolean userFavorite;

	private String comment;

	@Column(name = "date_last_made")
	private LocalDate dateLastMade;


	public UserRecipe() {
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
		return "UserRecipe [id=" + id + ", recipeId=" + recipeId + ", userFavorite=" + userFavorite + ", comment="
				+ comment + ", dateLastMade=" + dateLastMade + ", user=" + user + "]";
	}

}
