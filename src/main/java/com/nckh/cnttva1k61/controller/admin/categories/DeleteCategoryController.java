package com.nckh.cnttva1k61.controller.admin.categories;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.services.CategoryService;

@Controller
public class DeleteCategoryController extends BaseController {
	@Autowired
 CategoryService categoryService;

	@RequestMapping(value = {"admin/deleteCategory"},method = RequestMethod.GET )
 private String cate_delete(final Model model,final HttpServletRequest request,
		                    final HttpServletResponse response) throws IOException {
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		categoryService.deleteById(id);
		response.sendRedirect("listCategories");


		return "admin/categories/Category";
		
}
}