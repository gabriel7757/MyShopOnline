package com.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;
import com.model.Product;
import com.service.ProductService;
import org.apache.commons.logging.*;
import org.springframework.ui.Model;


//import org.springframework.social.openidconect.api.Paypal;
//import org.springframework.social.openidconect.api.PaypalProfile;




@Controller
public class ProductController {
	
	protected final Log logger = LogFactory.getLog(getClass());  
	
	@Autowired
	private ProductService productService;
		
	@RequestMapping("/index")
	public String setupForm(Map<String, Object>map)
	{
		Product product = new Product();
		map.put("product",product);		
		map.put("listProducts",productService.getAllProducts());
		return "product";
	}
	
	
	
	

	@RequestMapping(value="/productDelete.do", method=RequestMethod.POST)
	public String deleteProduct(@ModelAttribute("product") Product product, BindingResult result,
			@RequestParam String action, Map<String, Object>map)
	{
		Product productResult = new Product();
		
		logger.info("Entramos en delete con id: "+product.getCode()+"");
		//ModelAndView mv = new ModelAndView("redirect:setupForm");
		logger.info("Product="+product.getCode()+" -- "+product.getNameProduct()+" -- "+product.getPrice()+" --"+product.getStock());
		logger.info("Result="+result);
		logger.info("map="+map);

		productService.delete(product);
   	    logger.info("finaliza delete");
		
		map.put("product", productResult);
		map.put("listProducts", productService.getAllProducts());
		return "product";
		 
	}
	
	
		
	@RequestMapping(value = "/multiDelete.do", method = RequestMethod.POST, 
			       consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)	
	 @ResponseBody
	//String multiDeleteProduct(@RequestBody Product product, Map<String, Object>map){
	public String multiDeleteProduct(@RequestBody Product product){
		
		logger.info("empieza delete:"+ product);
		//Product productResult = new Product();
		try
		{
		//productService.delete(product);
		}
		catch(Exception e)
		{
			logger.info(e.getMessage());
		}
		
//		    int i=0;
//	        logger.info("Entramos en delete con id: "+product[i].getCode());
//	        for(i=0; i<product.length; i++)
//	        {
//	           logger.info("id: "+product[i].getCode());
//	    	   productService.delete(product[i]);
//	        }

		logger.info("finaliza delete");
//
	        // map.put("product", productResult);
			//map.put("listProducts", productService.getAllProducts());
			//return "product";
		    return "product";
	}
	
	
	/*@RequestMapping(value="/multiDelete.do", method= RequestMethod.POST)
	public Product multiDeleteProducto(@ModelAttribute("product") Product product, Model model)
	{
		logger.info("empieza delete:"+ product.getNameProduct()+" codigo="+product.getCode());
		
		Product product=null;	
		Product productResult = new Product();
		try
		{
		productService.delete(product);
		}
		catch(Exception e)
		{
			logger.info(e.getMessage());
		}
	
		
//		    int i=0;
//	        logger.info("Entramos en delete con id: "+product[i].getCode());
//	        for(i=0; i<product.length; i++)
//	        {
//	           logger.info("id: "+product[i].getCode());
//	    	   productService.delete(product[i]);
//	        }
//	        logger.info("finaliza delete");
//
	        // map.put("product", productResult);
			//map.put("listProducts", productService.getAllProducts());
			//return "product";
		//result= "{ \"nameProduct\":\""+nameProduct+"\" , \"price\": \""+price+"\" }";   
		return product;
	}
	
	*/
	
	
//	@RequestMapping(value="add", method=RequestMethod.POST)
//	public String add(@Valid @ModelAttribute("product") Product product, BindingResult result, 
//			@RequestParam String action, Map<String, Object>map)
//	{
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("add");
//		
//		
//		
//		return "";
//	}
	
	
	
	
	@RequestMapping(value="/product.do", method=RequestMethod.POST)
	//public String doActions( @ModelAttribute("product") @Valid Product product, final BindingResult result, 
	public String doActions( @ModelAttribute("product") Product product, BindingResult result,
			@RequestParam String action, Map<String, Object>map)
	{
		
		logger.info("Entra en doAction");
		logger.info("Product="+product.getCode()+" -- "+product.getNameProduct()+" -- "+product.getPrice()+" --"+product.getStock());
		logger.info("Result="+result);
		logger.info("action="+action);
		logger.info("map="+map);
				
		//case del crud
		Product productResult = new Product();
		switch(action.toLowerCase())
		{
		case "add": 
			productService.add(product);
			productResult = product;
			logger.info("finaliza el alta");
			break;
		case "edit":
			productService.edit(product);
			productResult = product;
			System.out.println("editamos Product");
			break;
		case "delete":
			logger.info("Entra en delete");
			logger.info("Product="+product.getCode()+" -- "+product.getNameProduct()+" -- "+product.getPrice()+" --"+product.getStock());
			logger.info("Result="+result);
			logger.info("action="+action);
			logger.info("map="+map);
			//product.setCode(31);
			
			
			productService.delete(product);
			productResult= new Product();
			logger.info("finaliza delete");
			break;
		case "search":
			Product searchProduct = productService.getProduct(product.getCode());
			productResult = searchProduct!=null ? searchProduct : new Product();
			break;
		}
		
		map.put("product", productResult);
		map.put("listProducts", productService.getAllProducts());
		//logger.config("hace return");
		return "product";
	
	}
	
	//@Secured(value="IS_AUTHENTICATED_FULLY")
	@RequestMapping(value="/redirect_userHome.do", method=RequestMethod.GET)
	public String getProfileUser(Model model)
	{
		logger.info("Entra en controlador de usuario de Product");
		model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        logger.info("Bean tiene="+model);
		return "userHome";
	}
	
	
   /* @RequestMapping(value="/userHome", method=RequestMethod.GET)
		public String login()
		{
			logger.info("Entra en login");
			return "userHome";
		} */

	
    @RequestMapping(value="/userLogin", method=RequestMethod.GET)
	public ModelAndView Login(@RequestParam(value="error",  required = false) String error,
			                      @RequestParam(value="logout", required = false) String logout)
	{
		logger.info("Entra en userlogin");
		ModelAndView model = new ModelAndView();
		if (error != null)
		{
			model.addObject("error",  "User or password is not valid!!");
		}
		
		if (logout != null)
		{
			model.addObject("msg",  "Logged out sucessfully!!");
		}
		model.setViewName("product");
		return model;
	}

	
    @RequestMapping(value="/MyShopOnline/userHome", method=RequestMethod.GET)
	public void getUserProfile(Model model)
	{
		logger.info("Entra en controlador google red social");
		model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        logger.info("Bean tiene="+model);
	}
    
    @RequestMapping(value="/", method=RequestMethod.GET)
  	public String gePaypal(Model model)
  	{
  		logger.info("Entra en controlador paypal");
  		//PayPalProfile paypalProfile = paypal.getUserProfile();
  		//model.addAttribute("profile", paypalProfile);
  		model.addAttribute("profile", "prueba");
        logger.info("Bean tiene="+model);
        return "product";
  	}
      
	

}
