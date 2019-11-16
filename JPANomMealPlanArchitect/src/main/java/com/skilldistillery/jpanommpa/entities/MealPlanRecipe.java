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
import javax.persistence.Table;

@Entity
@Table(name = "meal_plan_recipe")
public class MealPlanRecipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "meal_plan_id")
	private int mealPlanId;

	@Column(name = "sequence_number")
	private Integer sequenceNumber;
	@Column(name = "type_id")
	private Integer typeId;
	@Column(name = "day_name")
	@Enumerated(EnumType.STRING)
	private Days day;

	@OneToMany
	@JoinColumn(name = "id")
	private List<Recipe> recipes;

	@OneToMany
	@JoinColumn(name = "id")
	private List<MealPlan> mealPlan;

	@OneToMany
	@JoinColumn(name = "id")
	private List<RecipeType> types;

	public List<RecipeType> getTypes() {
		return types;
	}

	public void setTypes(List<RecipeType> types) {
		this.types = types;
	}

	public MealPlanRecipe() {
		super();
	}

	public List<MealPlan> getMealPlan() {
		return mealPlan;
	}

	public void setMealPlan(List<MealPlan> mealPlan) {
		this.mealPlan = mealPlan;
	}

	public int getId() {
		return id;
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

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Days getDay() {
		return day;
	}

	public void setDay(Days day) {
		this.day = day;
	}

	public List<Recipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}

	public int getMealPlanId() {
		return mealPlanId;
	}

	public void setMealPlanId(int mealPlanId) {
		this.mealPlanId = mealPlanId;
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
		return "MealPlanRecipe [id=" + id + ", sequenceNumber=" + sequenceNumber + ", typeId=" + typeId + ", day=" + day
				+ ", mealPlan=" + mealPlan + ", types=" + types + "]";
	}
}
