package com.nckh.cnttva1k61.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.DepartmentSearchModel;
import com.nckh.cnttva1k61.dto.NewsSearchModel;
import com.nckh.cnttva1k61.entities.Department;
import com.nckh.cnttva1k61.services.DepartmentService;
import com.nckh.cnttva1k61.services.NewsService;
import com.nckh.cnttva1k61.services.PagerData;

@Controller
public class UserDepartmentController extends BaseController{
	@Autowired
	DepartmentService departmentService; 
	@Autowired
	NewsService newsService ;
	@RequestMapping(value = "/Department/{seo}",method = RequestMethod.GET)
	private String getDepartment (final Model model,HttpServletRequest request,
			HttpServletResponse response, @PathVariable("seo") String seo) throws IOException 
	{
		DepartmentSearchModel departmentSearchModel2 = new DepartmentSearchModel();	 
		model.addAttribute("Department", departmentService.search(departmentSearchModel2));
		
		DepartmentSearchModel departmentSearchModel = new DepartmentSearchModel();
		departmentSearchModel.seo = seo;
		PagerData<Department> pagerData =  departmentService.search(departmentSearchModel);
		Department department = pagerData.getData().get(0);
		model.addAttribute("dp", department);
		//list danh sách
		model.addAttribute("list",departmentService.findAll());
		NewsSearchModel newsSearchModel = new NewsSearchModel();
		model.addAttribute("fourNews", newsService.FourLastNews(newsSearchModel));
		return "user/Department";
	}
}
