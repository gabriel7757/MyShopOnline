package com.model;
import java.io.Serializable;

import javax.persistence.*;

import com.google.gson.Gson;



import org.apache.commons.logging.*;
import org.springframework.beans.factory.annotation.Autowired;

@Entity   //indica que la clase es una entidad de tipo Beans
//@Table(name="product")
public class Product implements Serializable {
		
	/**
	 * 
	 */

	
	private static final long serialVersionUID = 1L;
	@Id    //asignamos una propiedad que va a actuar como identificador
	@Column  // indica contra que columna se producirá el mapeo
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int code;
	@Column
	private int stock;
	@Column	
	private double price;	
	@Column
	private String nameProduct;
	
	
	
	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	public Product() {
		
		
	}
	public Product(int code, String producto, int stock, double precio) {
		super();
		this.code = code;
		this.nameProduct = producto;
		this.stock = stock;
		this.price = precio;
		
	}

	public String myAsJson() {
	    return "holaaa mundoooo";
	}

	
	public String getAsJson() {		
		Log logger = LogFactory.getLog(getClass()); 
		logger.info("antes de Gson");
		//Gson gson= new Gson();
		
		//return "retorno nada";
		
		String json="";	
	
		json = new Gson().toJson(this).toString();
		logger.info("ojo el json==="+json);
		return json; 
	}

	public int getCode() {
		return code;
	}




	public void setCode(int code) {
		this.code = code;
	}




	public String getProducto() {
		return nameProduct;
	}




	public void setProducto(String product) {
		this.nameProduct = product;
	}




	public int getStock() {
		return stock;
	}




	public void setStock(int stock) {
		this.stock = stock;
	}




	public double getPrice() {
		return this.price;
	}




	public void setPrice(double price) {
		this.price = price;
	}


}
