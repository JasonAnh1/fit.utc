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

import com.nckh.cnttva1k61.entities.News;
import com.nckh.cnttva1k61.services.CategoryService;
import com.nckh.cnttva1k61.services.NewsService;

@Controller
public class AddNewsController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private NewsService newsService;
    
	@RequestMapping(value = { "/admin/addNews" }, method = RequestMethod.GET)
	public String get_addproduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("news", new News());
//gui danh sach categories xuong view
		model.addAttribute("categories", categoryService.findAll());

		return "admin/news/AddNews";
	}

	@RequestMapping(value = { "/admin/addNews" }, method = RequestMethod.POST)
	public String addCategories(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("news") News news, @RequestParam("newsAvatar") MultipartFile newsAvatar,
			@RequestParam("newsPictures") MultipartFile[] newsPictures) throws IOException {
		newsService.add(news, newsAvatar, newsPictures);
		newsService.saveOrUpdate(news);
		response.sendRedirect("listNews");
		return "admin/news/AddNews";
	}
}
