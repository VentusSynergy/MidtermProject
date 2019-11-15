package com.skilldistillery.jpanommpa.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private LocalDate dateCreated;
	private boolean active;
	private int creatorId;
	private boolean isPublic;
	private String prepTime;
	private String instructions;
	private String photoLink;
	private String cookbook;
	private String cookbookPageNumber;
	private String webLink;
	private int categoryId;
	private int type_id;

////	@ManyToOne
//	@JoinColumn(name = "creator_id")
//	private User user;

	public Recipe() {
		super();
	}

	public int getId() {
		return id;
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

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
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

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + categoryId;
		result = prime * result + ((cookbook == null) ? 0 : cookbook.hashCode());
		result = prime * result + ((cookbookPageNumber == null) ? 0 : cookbookPageNumber.hashCode());
		result = prime * result + creatorId;
		result = prime * result + ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result + id;
		result = prime * result + ((instructions == null) ? 0 : instructions.hashCode());
		result = prime * result + (isPublic ? 1231 : 1237);
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((photoLink == null) ? 0 : photoLink.hashCode());
		result = prime * result + ((prepTime == null) ? 0 : prepTime.hashCode());
		result = prime * result + type_id;
		result = prime * result + ((webLink == null) ? 0 : webLink.hashCode());
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
		if (active != other.active)
			return false;
		if (categoryId != other.categoryId)
			return false;
		if (cookbook == null) {
			if (other.cookbook != null)
				return false;
		} else if (!cookbook.equals(other.cookbook))
			return false;
		if (cookbookPageNumber == null) {
			if (other.cookbookPageNumber != null)
				return false;
		} else if (!cookbookPageNumber.equals(other.cookbookPageNumber))
			return false;
		if (creatorId != other.creatorId)
			return false;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (id != other.id)
			return false;
		if (instructions == null) {
			if (other.instructions != null)
				return false;
		} else if (!instructions.equals(other.instructions))
			return false;
		if (isPublic != other.isPublic)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (photoLink == null) {
			if (other.photoLink != null)
				return false;
		} else if (!photoLink.equals(other.photoLink))
			return false;
		if (prepTime == null) {
			if (other.prepTime != null)
				return false;
		} else if (!prepTime.equals(other.prepTime))
			return false;
		if (type_id != other.type_id)
			return false;
		if (webLink == null) {
			if (other.webLink != null)
				return false;
		} else if (!webLink.equals(other.webLink))
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
		builder.append(", creatorId=");
		builder.append(creatorId);
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
		builder.append(", type_id=");
		builder.append(type_id);
		builder.append("]");
		return builder.toString();
	}

}
