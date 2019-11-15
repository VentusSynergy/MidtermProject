package com.skilldistillery.jpanommpa.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MealPlanRecipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "meal_plan_id")
	private int mealPlanId;
	@Column(name = "recipe_id")
	private int recipeId;
	@Column(name = "sequence_number")
	private int sequenceNumber;
	@Column(name = "type_id")
	private int typeId;
	private Days day;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMealPlanId() {
		return mealPlanId;
	}

	public void setMealPlanId(int mealPlanId) {
		this.mealPlanId = mealPlanId;
	}

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public int getSequenceNumber() {
		return sequenceNumber;
	}

	public void setSequenceNumber(int sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public Days getDay() {
		return day;
	}

	public void setDay(Days day) {
		this.day = day;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		result = prime * result + id;
		result = prime * result + mealPlanId;
		result = prime * result + recipeId;
		result = prime * result + sequenceNumber;
		result = prime * result + typeId;
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
		MealPlanRecipe other = (MealPlanRecipe) obj;
		if (day != other.day)
			return false;
		if (id != other.id)
			return false;
		if (mealPlanId != other.mealPlanId)
			return false;
		if (recipeId != other.recipeId)
			return false;
		if (sequenceNumber != other.sequenceNumber)
			return false;
		if (typeId != other.typeId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MealPlanRecipe [id=");
		builder.append(id);
		builder.append(", mealPlanId=");
		builder.append(mealPlanId);
		builder.append(", recipeId=");
		builder.append(recipeId);
		builder.append(", sequenceNumber=");
		builder.append(sequenceNumber);
		builder.append(", typeId=");
		builder.append(typeId);
		builder.append(", day=");
		builder.append(day);
		builder.append("]");
		return builder.toString();
	}
}
