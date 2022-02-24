package com.nckh.cnttva1k61.controller.admin.news;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.services.NewsService;

@Controller
public class DeleteNewsController extends BaseController {
	@Autowired
  NewsService newsService;
     

	@RequestMapping(value = {"admin/deleteNews"},method = RequestMethod.GET )
 private String post_delete(final Model model,final HttpServletRequest request,
		                    final HttpServletResponse response) throws IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		newsService.deleteById(id);
		response.sendRedirect("listNews");
		return "admin/news/News";
		
}
}
