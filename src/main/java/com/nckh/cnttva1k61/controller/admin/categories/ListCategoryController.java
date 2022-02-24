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
import com.nckh.cnttva1k61.dto.CategorySearchModel;
import com.nckh.cnttva1k61.services.CategoryService;

@Controller
public class ListCategoryController extends BaseController {
	@Autowired
	private CategoryService categoryService;
	
@RequestMapping(value = {"/admin/listCategories"}, method = RequestMethod.GET)
private String getListCategories(final Model model,final HttpServletRequest request,
		                         final HttpServletResponse response) throws IOException{
	
	String keyword = request.getParameter("keyword");
	CategorySearchModel categorySearchModel = new CategorySearchModel();
	categorySearchModel.keyword = keyword;
	categorySearchModel.page = getCurrentPage(request);
	model.addAttribute("categorySearch",categoryService.search(categorySearchModel));
	model.addAttribute("categorySearchModel",categorySearchModel);
	// TODO Auto-generated method stub
        return "admin/categories/Category";
}
}
