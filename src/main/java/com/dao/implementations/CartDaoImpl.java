package com.dao.implementations;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CartDao;
import com.model.Cart;
import com.model.Product;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SessionFactory session;
	
	
	@Override
	public void addCart(Cart cart) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(cart);
		
	}

	@Override
	public void editCart(Cart cart) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(cart);
		
	}

	@Override
	public void deleteCart(Cart cart) {
		// TODO Auto-generated method stub
		session.getCurrentSession().delete(cart);
		
	}

	@Override
	public Cart getCart(int cartId) {
		return (Cart) session.getCurrentSession().get(Product.class, cartId);
	}

	@Override
	public List getAllCart() {
		// TODO Auto-generated method stub
		String query="from Cart";
		return session.getCurrentSession().createQuery(query).list();
	}

}
