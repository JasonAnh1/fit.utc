package com.nckh.cnttva1k61.controller.admin.categories;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.entities.Categories;
import com.nckh.cnttva1k61.services.CategoryService;

@Controller
public class AddCategoriesController extends BaseController{
	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = { "/admin/addCategories" }, method = RequestMethod.GET)
	public String get_addcategories(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("category", new Categories());
		List<Categories> list = categoryService.findAll();
		model.addAttribute("listcate", list);
		return "admin/categories/AddCategory";
	}

	@RequestMapping(value = { "/admin/addCategories" }, method = RequestMethod.POST)
	public String post_addcategories(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("category") Categories categories) throws IOException {
		categoryService.add(categories);
		categoryService.saveOrUpdate(categories);
		response.sendRedirect("listCategories");
		return "admin/categories/AddCategory";
	}
}
