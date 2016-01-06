package com.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;

import com.model.Product;



public interface ProductService {	
	@Transactional
	 public void add(Product product);
	@Transactional
	 public void edit(Product product);
	@Transactional
	 //public void delete(Product product);
	public void delete(Product idProduct);
	@Transactional
	 public Product getProduct(int idProduct);
	@Transactional
     public List getAllProducts();

}
