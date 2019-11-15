package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

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
	private List<RecipeIngredient> recipeIngredients;



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
	@Column(name = "category_id")
	private Integer categoryId;
	@Column(name = "type_id")
	private Integer typeId;

	public Recipe() {
		super();
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

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
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

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

//	public List<RecipeIngredient> getRecipeIngredients() {
//		return recipeIngredients;
//	}
//
//	public void setRecipeIngredients(List<RecipeIngredient> recipeIngredients) {
//		this.recipeIngredients = recipeIngredients;
//	}

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
		builder.append(", categoryId=");
		builder.append(categoryId);
		builder.append(", typeId=");
		builder.append(typeId);
		builder.append("]");
		return builder.toString();
	}

}
