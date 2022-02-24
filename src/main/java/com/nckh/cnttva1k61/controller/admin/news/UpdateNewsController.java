package com.nckh.cnttva1k61.controller.admin.news;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.entities.News;
import com.nckh.cnttva1k61.services.CategoryService;
import com.nckh.cnttva1k61.services.NewsService;

@Controller
public class UpdateNewsController extends BaseController{
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private NewsService newsService;

	@RequestMapping(value = "/admin/updateNews", method = RequestMethod.GET)
	public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response) {
		News news = new News();
		Integer id = Integer.parseInt(request.getParameter("cid"));
		news = newsService.getById(id);
		model.addAttribute("news", news);
//gui danh sach categories xuong view
		model.addAttribute("categories", categoryService.findAll());
		return "admin/news/UpdateNews";
	}

	@RequestMapping(value = "/admin/updateNews", method = RequestMethod.POST)
	public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("news") News news, @RequestParam("newsAvatar") MultipartFile newsAvatar,
			@RequestParam("newsPictures") MultipartFile[] newsPictures) throws IOException {
		newsService.update(news, newsAvatar, newsPictures);
		newsService.saveOrUpdate(news);

		response.sendRedirect("listNews");
		return "admin/news/UpdateNews";

	}
}
