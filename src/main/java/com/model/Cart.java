package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class Cart {
	
	@Id    //asignamos una propiedad que va a actuar como identificador
	@Column  // indica contra que columna se producirá el mapeo
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cartId;
	@Column
	private int customerId;
	@Column
	private int productId;
	@Column
	private int quantity;
	@Column
	private int active;
	@Column
	private int delete;
	
	
	
	public Cart(){
		
	}	
	
	public Cart(int cartId, int customerId, int productId, int quantity,
			int active, int delete) {
		
		this.cartId = cartId;
		this.customerId = customerId;
		this.productId = productId;
		this.quantity = quantity;
		this.active = active;
		this.delete = delete;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCantidad() {
		return quantity;
	}
	public void setCantidad(int quantity) {
		this.quantity = quantity;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getDelete() {
		return delete;
	}
	public void setDelete(int delete) {
		this.delete = delete;
	}
	
	
	
	
	
	
	
	
	

}
