package com.nckh.cnttva1k61.controller.admin.department;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.CategorySearchModel;
import com.nckh.cnttva1k61.dto.DepartmentSearchModel;
import com.nckh.cnttva1k61.entities.Categories;
import com.nckh.cnttva1k61.entities.Department;
import com.nckh.cnttva1k61.services.CategoryService;
import com.nckh.cnttva1k61.services.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class DepartmentController extends BaseController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = {"/admin/listDepartment"}, method = RequestMethod.GET)
    private String getListDepartment(final Model model, final HttpServletRequest request,
                                     final HttpServletResponse response) throws IOException {

        String keyword = request.getParameter("keyword");
        DepartmentSearchModel departmentSearchModel = new DepartmentSearchModel();
        departmentSearchModel.keyword = keyword;
        departmentSearchModel.page = getCurrentPage(request);
        model.addAttribute("departmentSearch", departmentService.search(departmentSearchModel));
        model.addAttribute("departmentSearchModel", departmentSearchModel);
        // TODO Auto-generated method stub
        return "admin/department/Department";
    }
    @RequestMapping(value = { "/admin/addDepartment" }, method = RequestMethod.GET)
	public String get_addcategories(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("department", new Department());
		List<Department> list = departmentService.findAll();
		model.addAttribute("listDepartment", list);
		return "admin/department/AddDepartment";
	}

	@RequestMapping(value = { "/admin/addDepartment" }, method = RequestMethod.POST)
	public String post_addcategories(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("department") Department department) throws IOException {
		departmentService.add(department);
		departmentService.saveOrUpdate(department);
		response.sendRedirect("listDepartment");
		return "admin/department/AddDepartment";
	}
	
	@RequestMapping(value = { "/admin/updateDepartment"}, method = RequestMethod.GET)
	public String get_uDepart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		Department department = new Department();
		Integer id = Integer.parseInt(request.getParameter("cid"));
		department = departmentService.getById(id);
		model.addAttribute("department", department);
		List<Department> list = departmentService.findAll();
		model.addAttribute("listDepartment", list);
		return "admin/department/AddDepartment";
	}

	@RequestMapping(value = { "/admin/updateDepartment"}, method = RequestMethod.POST)
	public String post_uDepart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("department") Department department) throws IOException {
		departmentService.add(department);
		departmentService.saveOrUpdate(department);
		response.sendRedirect("listDepartment");
		return "admin/department/AddDepartment";
	}
	

	@RequestMapping(value = {"admin/deleteDepartment"},method = RequestMethod.GET )
 private String cate_delete(final Model model,final HttpServletRequest request,
		                    final HttpServletResponse response) throws IOException {
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		departmentService.deleteById(id);
		response.sendRedirect("listDepartment");


		return "admin/categories/Category";
		
}
	
	
}
