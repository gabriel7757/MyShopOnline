package com.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.model.Cart;



public interface CartService {	
	@Transactional
	 public void add(Cart product);
	@Transactional
	 public void edit(Cart product);
	@Transactional
	 //public void delete(Product product);
	public void delete(Cart cartId);
	@Transactional
	 public Cart getProduct(int cartId);
	@Transactional
    public List getAllProducts();
	}
