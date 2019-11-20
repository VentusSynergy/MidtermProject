package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {

//	+--------------+---------------+------+-----+-------------------+----------------+
//	| Field        | Type          | Null | Key | Default           | Extra          |
//	+--------------+---------------+------+-----+-------------------+----------------+
//	| id           | int(11)       | NO   | PRI | NULL              | auto_increment |
//	| username     | varchar(200)  | NO   |     | NULL              |                |
//	| email        | varchar(200)  | NO   |     | NULL              |                |
//	| password     | varchar(16)   | NO   |     | NULL              |                |
//	| first_name   | varchar(100)  | NO   |     | NULL              |                |
//	| last_name    | varchar(100)  | NO   |     | NULL              |                |
//	| active       | tinyint(4)    | NO   |     | 1                 |                |
//	| admin        | tinyint(4)    | NO   |     | 0                 |                |
//	| date_created | datetime      | YES  |     | CURRENT_TIMESTAMP |                |
//	| date_updated | datetime      | YES  |     | CURRENT_TIMESTAMP |                |
//	| avatar_url   | varchar(1000) | YES  |     | NULL              |                |
//	+--------------+---------------+------+-----+-------------------+----------------+

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String email;
	private String password;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	private Boolean active;
	private Boolean admin;
	@Column(name = "date_created")
	private LocalDateTime dateCreated;
	@Column(name = "date_updated")
	private LocalDateTime dateUpdated;
	@Column(name = "avatar_url")
	private String avatarURL;

	@OneToMany(mappedBy = "user")
	private List<UserRecipe> userRecipies;

	@OneToMany(mappedBy = "user")
	private List<Recipe> recipes;

	@OneToMany(mappedBy = "user")
	private List<RecipeReview> recipeReview;

	@OneToMany(mappedBy = "user")
	private List<MealPlan> mealPlans;

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<UserRecipe> getUserRecipies() {
		return userRecipies;
	}

	public void setUserRecipies(List<UserRecipe> userRecipies) {
		this.userRecipies = userRecipies;
	}

	public List<Recipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}

	public List<RecipeReview> getRecipeReview() {
		return recipeReview;
	}

	public void setRecipeReview(List<RecipeReview> recipeReview) {
		this.recipeReview = recipeReview;
	}

	public List<MealPlan> getMealPlans() {
		return mealPlans;
	}

	public void setMealPlans(List<MealPlan> mealPlans) {
		this.mealPlans = mealPlans;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", username=");
		builder.append(username);
		builder.append(", email=");
		builder.append(email);
		builder.append(", password=");
		builder.append(password);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", active=");
		builder.append(active);
		builder.append(", admin=");
		builder.append(admin);
		builder.append(", dateCreated=");
		builder.append(dateCreated);
		builder.append(", dateUpdated=");
		builder.append(dateUpdated);
		builder.append(", avatarURL=");
		builder.append(avatarURL);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((active == null) ? 0 : active.hashCode());
		result = prime * result + ((admin == null) ? 0 : admin.hashCode());
		result = prime * result + ((avatarURL == null) ? 0 : avatarURL.hashCode());
		result = prime * result + ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result + ((dateUpdated == null) ? 0 : dateUpdated.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + id;
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		User other = (User) obj;
		if (active == null) {
			if (other.active != null)
				return false;
		} else if (!active.equals(other.active))
			return false;
		if (admin == null) {
			if (other.admin != null)
				return false;
		} else if (!admin.equals(other.admin))
			return false;
		if (avatarURL == null) {
			if (other.avatarURL != null)
				return false;
		} else if (!avatarURL.equals(other.avatarURL))
			return false;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (dateUpdated == null) {
			if (other.dateUpdated != null)
				return false;
		} else if (!dateUpdated.equals(other.dateUpdated))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (id != other.id)
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	public String getEmail() {
		return email.toLowerCase();
	}

	public void setEmail(String email) {
		this.email = email.toLowerCase();
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public LocalDateTime getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(LocalDateTime dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public String getAvatarURL() {

		if (avatarURL == null || avatarURL.equalsIgnoreCase("")) {
			avatarURL = "https://i.imgur.com/FBJi16J.jpg";
		}
		return avatarURL;
	}

	public void setAvatarURL(String avatarURL) {

		if (avatarURL == null || avatarURL.equalsIgnoreCase("")) {
			this.avatarURL = "https://i.imgur.com/FBJi16J.jpg";
		}

		this.avatarURL = avatarURL;
	}

}
