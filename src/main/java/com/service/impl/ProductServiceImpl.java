package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductDao;
import com.model.Product;
import com.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Transactional
	public void add(Product product) {
		// TODO Auto-generated method stub
		productDao.addProduct(product);
		
	}

	@Transactional	
	public void edit(Product product) {
		// TODO Auto-generated method stub
		
		productDao.editProduct(product);
		
	}

	@Transactional
	public void delete(Product product) {
		// TODO Auto-generated method stub
		productDao.deleteProduct(product);
		
	}

	@Transactional
	public Product getProduct(int productId) {
		// TODO Auto-generated method stub
		return productDao.getProduct(productId);
	}

	@Transactional
	public List getAllProducts() {
		// TODO Auto-generated method stub
		return productDao.getAllProducts();
	}

}
