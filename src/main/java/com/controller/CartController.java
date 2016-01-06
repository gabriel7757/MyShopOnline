package com.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Cart;
import com.model.Product;
import com.service.CartService;


@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	protected final Log logger = LogFactory.getLog(getClass());  

	@RequestMapping(value="/addtoCart.do", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	//public String doActions( @ModelAttribute("product") @Valid Product product, final BindingResult result, 
	public String addtoCart(@RequestBody String id)
	{
	
		
		
		logger.info("Entramos en addToCart");	
		
		
		
		
		return null;
	}
	

}
