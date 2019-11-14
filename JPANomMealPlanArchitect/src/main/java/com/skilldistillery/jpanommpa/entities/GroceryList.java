package com.skilldistillery.jpanommpa.entities;

public class GroceryList {
	private int id;
	private int mealPlan;
	private boolean purchased;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMealPlan() {
		return mealPlan;
	}

	public void setMealPlan(int mealPlan) {
		this.mealPlan = mealPlan;
	}

	public boolean isPurchased() {
		return purchased;
	}

	public void setPurchased(boolean purchased) {
		this.purchased = purchased;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GroceryList [id=");
		builder.append(id);
		builder.append(", mealPlan=");
		builder.append(mealPlan);
		builder.append(", purchased=");
		builder.append(purchased);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + mealPlan;
		result = prime * result + (purchased ? 1231 : 1237);
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
		GroceryList other = (GroceryList) obj;
		if (id != other.id)
			return false;
		if (mealPlan != other.mealPlan)
			return false;
		if (purchased != other.purchased)
			return false;
		return true;
	}
}
