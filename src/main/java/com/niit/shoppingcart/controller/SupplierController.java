package com.niit.shoppingcart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Login;
import com.niit.shoppingcart.model.Supplier;
@Controller
public class SupplierController {

	@Autowired
	SupplierDAO sd;
	@Autowired
	Supplier supplier;
	@ModelAttribute("Supplier")
	public Supplier display122() {
		return new Supplier();
	
		
	}
	
	@RequestMapping("AddSupplier")
	public String display3() {

	System.out.println("welcoe dd suppleir");
		return "AddSupplier";
	}
	
	@RequestMapping("/ViewSupplier")
	public ModelAndView display8(@RequestParam int id) 
	{
	
		Supplier supplier=sd.getSingleSupplier(id);
	
		
		return new ModelAndView("ViewSupplier","supplier",supplier);
		
	}

	@RequestMapping("storesupplier")
	public String addBook(HttpServletRequest request, @Valid @ModelAttribute Supplier supplier,
			BindingResult result) {
		if (result.hasErrors()) {
			return "AddSupplier";
		}
		sd.saveOrUpdate(supplier);
		return "viewsuppliers";

	}
	@RequestMapping("/viewsuppliers")
	public ModelAndView display8() {
		ModelAndView m4 = new ModelAndView("viewsuppliers");
		List supplier=sd.getAllSuppliers();
		return m4;
	}

//	@RequestMapping("ManageSuppliers")
//	public ModelAndView display11() {
//		ModelAndView m10 = new ModelAndView("ManageSuppliers");
//		return m10;
//	}

	@RequestMapping(value = "listsup", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String showList()
	{
		List list = sd.getAllSuppliers();
		
		Gson x = new Gson();
		String json = x.toJson(list);
		return json;
	}

	@RequestMapping("/deletesupplier")
	public ModelAndView deleteSupplier(@RequestParam int id) {
		sd.delete(id);
		ModelAndView m1 = new ModelAndView("viewsuppliers");
		return m1;
	}


	@RequestMapping("admin")
	public ModelAndView display16() 
 	{
		ModelAndView m16 = new ModelAndView("admin");
		return m16;

	}	
	
	 		 
	 @RequestMapping("editsupplier")
		public ModelAndView display15() 
	 	{
			ModelAndView m6 = new ModelAndView("editsupplier");
			return m6;

		}	
	

	 @RequestMapping(value="editsupplier",method=RequestMethod.GET)
	    public ModelAndView editSup(@RequestParam int id){
		 Supplier supplier1=sd.getSingleSupplier(id);
	    	return new ModelAndView("editsupplier","Supplier",supplier1);
	    }
	 @RequestMapping(value="updatesupplier",method=RequestMethod.POST)
	    public ModelAndView updateSupplier(HttpServletRequest request,@Valid @ModelAttribute("Supplier")Supplier editsup,BindingResult result,Model model)
	    {
			sd.update(editsup);
			return new ModelAndView("viewsuppliers");
	    }	 
}
