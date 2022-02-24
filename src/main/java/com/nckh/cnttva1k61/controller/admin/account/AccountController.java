package com.nckh.cnttva1k61.controller.admin.account;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.entities.User;
import com.nckh.cnttva1k61.services.RoleService;
import com.nckh.cnttva1k61.services.UserService;
import com.nckh.cnttva1k61.components.Utilities;
import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.entities.Role;
@Controller
public class AccountController extends BaseController{

	@Autowired UserService userService;
	
	@Autowired RoleService roleService;
	
	@RequestMapping(value = "/admin/addAccount", method = RequestMethod.GET)
	public String addAccount(final Model model) throws IOException{
		model.addAttribute("account", new User());
		return "admin/account/AddAccount";
	}
	
	@RequestMapping(value = "/admin/customerAccount", method = RequestMethod.GET)
	public String customerAccount(final Model model) throws IOException{
		List<User> users = userService.search(null, 1).getData();
		model.addAttribute("users", users);
		return "admin/account/UserAccount";
	}
	
	@RequestMapping(value = "/admin/adminAccount", method = RequestMethod.GET)
	public String staffAccount(final Model model) throws IOException{
		List<User> users = userService.search(null, 2).getData();
		model.addAttribute("users", users);
		return "admin/account/AdminAccount";
	}
	
	@RequestMapping(value = "/admin/addAccount", method = RequestMethod.POST)
	public String addAccountPost(final Model model, HttpServletRequest request, @ModelAttribute("account") User user) throws IOException{
		int r = Integer.parseInt(request.getParameter("role"));
		Role role = roleService.getById(r);
		user.addRole(role);
		user.setPassword(Utilities.encode(user.getPassword()));
		userService.saveOrUpdate(user);
		return "admin/account/AddAccount";
	}
	
}
