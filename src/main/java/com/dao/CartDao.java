package com.dao;

import java.util.List;

import com.model.Cart;



public interface CartDao {
	
	public void addCart(Cart cart);
	public void editCart(Cart cart);
	public void deleteCart(Cart cart);
	public Cart getCart(int cartId);
	//public User queryProduct(int productId);
	public List getAllCart();
	
	

}
