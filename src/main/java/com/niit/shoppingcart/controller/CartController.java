package com.niit.shoppingcart.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CartItem;
import com.niit.shoppingcart.model.Login;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class CartController 
{
	
	@Autowired
	ProductDAO service3;
	@Autowired
	CartDAO service4;
	@Autowired
	UserDetails ud;
	@Autowired
	SessionFactory sf;
	@Autowired
	CartItem cartItem;
	
	   @ModelAttribute("CartItem")
	    public CartItem fun100()
	    {
	    	return new CartItem();
	    }
	   @ModelAttribute("Cart")
	    public Cart fun200()
	    {
	    	return new Cart();
	    }
	
	 @RequestMapping(value="/cartview",method=RequestMethod.GET)
		public String vcHello(@RequestParam int id,HttpSession session)	
	 {  
		 String username=(String)session.getAttribute("loggedInUser");
	    Product product=service3.getSingleProduct(id);
	   	List list=service4.getAllItems();
	
	   	
	   	for(int i=0;list.size()>i;i++)
	   	{
	   	  CartItem cti=(CartItem)list.get(i);
	   	  if((id==cti.getId()))
	   	  {
	    cartItem.setId(product.getId());
	    cartItem.setName(product.getName());
	    cartItem.setPrice(product.getPrice());
	    cartItem.setDescription(product.getDescription());
	   cartItem.setQuantity(cartItem.getQuantity()+1+cti.getQuantity());
	    cartItem.setPrice(product.getPrice()*cartItem.getQuantity());
	    
	    service4.add(cartItem);
        int count=cartItem.getCartItemId();
        service4.remove(--count);
	    return "viewCart";
	   	}
	   	}
   	cartItem.setId(product.getId());
	    cartItem.setName(product.getName());
	    cartItem.setPrice(product.getPrice());
	    cartItem.setDescription(product.getDescription());
	    cartItem.setQuantity(cartItem.getQuantity()+1);
	    cartItem.setPrice(product.getPrice()*cartItem.getQuantity());
	    
	    service4.add(cartItem);     
	    return "viewCart";
	    } 
	 @RequestMapping(value="/listone",method=RequestMethod.GET,produces="application/json")
	    	public @ResponseBody String showListOne(){
	    	List blist=service4.getAllItems();
	    	Gson x=new Gson();
	    	String json=x.toJson(blist);
	    	return json;
	    }
	 @RequestMapping("/deleteItemCart")
	    public ModelAndView deleteProduct(@RequestParam int id,Model model)
	    {
         	service4.remove(id);
         	model.addAttribute("cart",service4.getAllItems());
	    	return new ModelAndView("viewCart");
	    }
	 @RequestMapping("/removeAll")
	 public ModelAndView removeAllItem()
	 {
		 service4.removeAll();
		 return new ModelAndView("viewCart");
	 }
	 @RequestMapping("/alert")
	 public ModelAndView dis()
	 {
		  return new ModelAndView("alert");
	 }
	 @RequestMapping("/v")
	 public ModelAndView disp()
	 {
		  return new ModelAndView("viewproducts","product",service4.getAllItems());
	 }
	 
	 @RequestMapping("/viewcart")
	 public ModelAndView disp1()
	 {
		  return new ModelAndView("viewproduct","product",service4.getAllItems());
	 }
	 @RequestMapping(value="/checkOut",method=RequestMethod.GET)
	    public void createOrder()
		{
			System.out.println("Hello ABHIMANYU How ARE YOU ????????????");	
	    }	 
}
