package com.skilldistillery.jpanommpa.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "meal_plan_recipe")
public class MealPlanRecipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "sequence_number")
	private Integer sequenceNumber;
	@Column(name = "day_name")
	@Enumerated(EnumType.STRING)
	private Days day;

	@OneToOne
	@JoinColumn(name = "recipe_id")
	private Recipe recipe;

	

	@ManyToOne
	@JoinColumn(name = "meal_plan_id")
	private MealPlan mealPlan;

	@OneToOne
	@JoinColumn(name = "type_id")
	private RecipeType type;


	public RecipeType getType() {
		return type;
	}


	public void setType(RecipeType types) {
		this.type = types;
	}


	public MealPlanRecipe() {
		super();
	}


	public MealPlan getMealPlan() {
		return mealPlan;
	}

	public void setMealPlan(MealPlan mealPlan) {
		this.mealPlan = mealPlan;
	}

	public int getId() {
		return id;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getSequenceNumber() {
		return sequenceNumber;
	}

	public void setSequenceNumber(Integer sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
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
		MealPlanRecipe other = (MealPlanRecipe) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MealPlanRecipe [id=");
		builder.append(id);
		builder.append(", sequenceNumber=");
		builder.append(sequenceNumber);
		builder.append(", day=");
		builder.append(day);
		builder.append(", recipe=");
		builder.append(recipe);
		builder.append(", mealPlan=");
		builder.append(mealPlan);
		builder.append(", types=");
		builder.append(type);
		builder.append("]");
		return builder.toString();
	}
}
