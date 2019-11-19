package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(name = "date_created")
	private LocalDate dateCreated;
	private boolean active;

	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;

	@OneToMany(mappedBy = "recipe")
	private List<UserRecipe> userRecipies;
	
	@OneToMany(mappedBy = "recipe")
	private List<RecipeReview> reviews;

	@OneToMany(mappedBy = "recipe")
	private List<RecipeIngredient> recipeIngredients;

	@OneToOne
	@JoinColumn(name = "category_id")
	private Category category;
	
	@OneToOne
	@JoinColumn(name = "type_id")
	private RecipeType recipeType;

	@Column(name = "is_public")
	private boolean isPublic;
	@Column(name = "prep_time")
	private String prepTime;
	private String instructions;
	@Column(name = "photo_link")
	private String photoLink;
	private String cookbook;
	@Column(name = "cookbook_page_number")
	private String cookbookPageNumber;
	@Column(name = "web_link")
	private String webLink;

	public Recipe() {
		super();
	}

	public List<RecipeReview> getReviews() {
		return reviews;
	}

	public void setReviews(List<RecipeReview> reviews) {
		this.reviews = reviews;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<RecipeIngredient> getRecipeIngredients() {
		return recipeIngredients;
	}

	public void setRecipeIngredients(List<RecipeIngredient> recipeIngredients) {
		this.recipeIngredients = recipeIngredients;
	}

	public List<UserRecipe> getUserRecipies() {
		return userRecipies;
	}

	public void setUserRecipies(List<UserRecipe> userRecipies) {
		this.userRecipies = userRecipies;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDate getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDate dateCreated) {
		this.dateCreated = dateCreated;
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

	public boolean getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public String getPrepTime() {
		return prepTime;
	}

	public void setPrepTime(String prepTime) {
		this.prepTime = prepTime;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public String getPhotoLink() {
		return photoLink;
	}

	public void setPhotoLink(String photoLink) {
		this.photoLink = photoLink;
	}

	public String getCookbook() {
		return cookbook;
	}

	public void setCookbook(String cookbook) {
		this.cookbook = cookbook;
	}

	public String getCookbookPageNumber() {
		return cookbookPageNumber;
	}

	public void setCookbookPageNumber(String cookbookPageNumber) {
		this.cookbookPageNumber = cookbookPageNumber;
	}

	public String getWebLink() {
		return webLink;
	}

	public void setWebLink(String webLink) {
		this.webLink = webLink;
	}


	public RecipeType getRecipeType() {
		return recipeType;
	}

	public void setRecipeType(RecipeType recipeType) {
		this.recipeType = recipeType;
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
		Recipe other = (Recipe) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Recipe [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", dateCreated=");
		builder.append(dateCreated);
		builder.append(", active=");
		builder.append(active);
		builder.append(", user=");
		builder.append(user);
		builder.append(", category=");
		builder.append(category);
		builder.append(", recipeType=");
		builder.append(recipeType);
		builder.append(", isPublic=");
		builder.append(isPublic);
		builder.append(", prepTime=");
		builder.append(prepTime);
		builder.append(", instructions=");
		builder.append(instructions);
		builder.append(", photoLink=");
		builder.append(photoLink);
		builder.append(", cookbook=");
		builder.append(cookbook);
		builder.append(", cookbookPageNumber=");
		builder.append(cookbookPageNumber);
		builder.append(", webLink=");
		builder.append(webLink);
		builder.append("]");
		return builder.toString();
	}

}
