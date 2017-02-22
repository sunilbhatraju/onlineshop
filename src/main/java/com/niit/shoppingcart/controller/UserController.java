package com.niit.shoppingcart.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Login;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {

	@Autowired
	UserDAO registerdao;
	@RequestMapping("ManageUsers")
	public ModelAndView userList(){
		ModelAndView mv9 = new ModelAndView("ManageUsers");
		return mv9;
	}
	@RequestMapping("viewuser")
	public ModelAndView viewuser(){
		ModelAndView mv9 = new ModelAndView("viewuser");
	return mv9;
	}
	@RequestMapping(value = "viewuser", method = RequestMethod.GET)
	public ModelAndView viewPro(@RequestParam int id, @ModelAttribute Login loginuser) {
		Login user = registerdao.getSingleUser(id);
		return new ModelAndView("viewuser", "user", user);
	}
	@RequestMapping(value="edituser", method=RequestMethod.GET)
	public ModelAndView edituser(@RequestParam int id){
		UserDetails u1=registerdao.get(id);
		return new ModelAndView("edituser","User",u1);
	}
	@RequestMapping(value = "listusers", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String showList()
	{
		List list = registerdao.getAllUsers();
		Gson x = new Gson();
		String json = x.toJson(list);
		return json;
	}

	@RequestMapping("login")
	public ModelAndView display1() {
		ModelAndView mv1 = new ModelAndView("login");
		return mv1;
	}
	@RequestMapping("logoutsuccess")
	public ModelAndView display10() {
		ModelAndView mv1 = new ModelAndView("home");
		return mv1;
	}
	@RequestMapping("contact")
	public ModelAndView display12() {
		ModelAndView mv12 = new ModelAndView("contact");
		return mv12;
	}

	@RequestMapping(value = "/fail2login", method = RequestMethod.GET)
	public ModelAndView loginerror(ModelMap model) {
		return new ModelAndView("login", "error", true);
	}

	@RequestMapping("register")
	public ModelAndView display2() {

		ModelAndView mv2 = new ModelAndView("register");
		return mv2;
	}

	@RequestMapping(value = "/storeUser", method = RequestMethod.POST)
	public String addUser(@Valid @ModelAttribute("UserDetails") UserDetails registeruser,BindingResult r) {
		if(r.hasErrors())
		{
			return "register";
		}
		registerdao.saveorUpdate(registeruser);
		Login loginuser = new Login();
		loginuser.setUsername(registeruser.getUsername());
		loginuser.setPassword(registeruser.getPassword());
		loginuser.setStatus(registeruser.getStatus());
		loginuser.setRole(registeruser.getRole());
		registerdao.saveorUpdate(loginuser);
		return "regsuccess";
	}
	

	@RequestMapping("deleteuser")
	public ModelAndView deleteLogin(@RequestParam int id,@Valid @ModelAttribute("Login")Login loginuser) {
		registerdao.delete(id);
		ModelAndView m1 = new ModelAndView("ManageUsers");
		return m1;
	}
	@ModelAttribute("UserDetails")
	public UserDetails registerUser() {
		return new UserDetails();

	}

//	@ModelAttribute("User")
//	public Login createUser() {
//		return new Login();
//
//	}

	@RequestMapping("/Admin")
	public ModelAndView display5() {
		ModelAndView m5 = new ModelAndView("Admin");
		return m5;
	}
	@RequestMapping(value = "/welcome")
	public ModelAndView checkUserOne(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		
		if (request.isUserInRole("ROLE_ADMIN")) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String str = auth.getName(); 
			session = request.getSession(true);
			session.setAttribute("loggedInUser", str);
			// session.invalidate();
			ModelAndView m1 = new ModelAndView("admin");
			return m1;
		}
	
		else if(request.isUserInRole("ROLE_USER"))
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String str = auth.getName();
			session = request.getSession(true);
			session.setAttribute("loggedInUser", str);
			ModelAndView m2 = new ModelAndView("user");
			return m2;
		}
		else
		{
			System.out.println("dgddg");
			ModelAndView mv= new ModelAndView("home");
			return mv;
		}
		
	}
	@RequestMapping(value="/updateuser",method=RequestMethod.POST)
    public ModelAndView updateLogin(HttpServletRequest request,@Valid @ModelAttribute("Login")Login editlogin,BindingResult result)
    {
		registerdao.update(editlogin);
		return new ModelAndView("ManageUsers");
    }

}

