package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CartDao;
import com.model.Cart;
import com.service.CartService;



@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	
	@Transactional
	public void add(Cart cart) {
		// TODO Auto-generated method stub
		cartDao.addCart(cart);
		
	}

	@Transactional	
	public void edit(Cart cart) {
		// TODO Auto-generated method stub
		
		cartDao.editCart(cart);
		
	}

	@Transactional
	public void delete(Cart cart) {
		// TODO Auto-generated method stub
		cartDao.deleteCart(cart);
		
	}

	@Transactional
	public Cart getProduct(int productId) {
		// TODO Auto-generated method stub
		return cartDao.getCart(productId);
	}

	@Transactional
	public List getAllProducts() {
		// TODO Auto-generated method stub
		return cartDao.getAllCart();
	}

}
