package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "Items")
@Table(name = "ItemTable")

public class Items {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ItemId;

	public int getItemId() {
		return ItemId;
	}

	public void setItemId(int itemId) {
		ItemId = itemId;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	}

	public String getUnit() {
		return Unit;
	}

	public void setUnit(String unit) {
		Unit = unit;
	}

	public String getItemImage() {
		return ItemImage;
	}

	public void setItemImage(String itemImage) {
		ItemImage = itemImage;
	}

	public String getItemDescription() {
		return ItemDescription;
	}

	public void setItemDescription(String itemDescription) {
		ItemDescription = itemDescription;
	}

	private int Price;
	private String ItemDescription, Unit, ItemImage;

}
