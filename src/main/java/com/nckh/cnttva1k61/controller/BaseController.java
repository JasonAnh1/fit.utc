package com.nckh.cnttva1k61.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.nckh.cnttva1k61.entities.Categories;
import com.nckh.cnttva1k61.entities.Role;
import com.nckh.cnttva1k61.entities.User;
import com.nckh.cnttva1k61.services.CategoryService;
import com.nckh.cnttva1k61.services.RoleService;


public abstract class BaseController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private RoleService roleService;

	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;

		return null;

	}

	private List<String> roles() {
		List<String> roles = new ArrayList<String>();
		User logined = getUserLogined();

		if (logined == null)
			return roles;
		for (Role r : logined.getRoles()) {
			roles.add(r.getAuthority());
		}

		return roles;
	}

	@ModelAttribute("isAdmin")
	public boolean isAdmin() {
		for (String role : roles()) {
			if (role.equalsIgnoreCase("admin"))
				return true;
		}
		return false;
	}

	@ModelAttribute("isMember")
	public boolean isMember() {
		for (String role : roles()) {
			if (role.equalsIgnoreCase("isMember"))
				return true;
		}
		return false;
	}

	@ModelAttribute("roles")
	public List<Role> role() {
		return roleService.findAll();
	}
	@ModelAttribute("categories")
	public List<Categories> listCate() {

		return this.categoryService.findAll();
	}

	// Lấy current page page, ko có thì mặc định là 1
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}

	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}

	public Boolean getBoolean(HttpServletRequest request, String ishot) {
		try {
			return Boolean.parseBoolean(request.getParameter(ishot));
		} catch (Exception e) {
			return null;
		}
	}

}
