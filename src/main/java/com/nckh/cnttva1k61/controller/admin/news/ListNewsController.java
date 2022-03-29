package com.nckh.cnttva1k61.controller.admin.news;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.NewsSearchModel;
import com.nckh.cnttva1k61.services.NewsService;

@Controller
public class ListNewsController extends BaseController {
	@Autowired 
	private NewsService newsService;

	
	@RequestMapping(value = { "/admin/listNews" }, method = RequestMethod.GET)
	public String get_listNews(final Model model, final HttpServletRequest request, final HttpServletResponse response)

	{
		String keyword = request.getParameter("keyword");
		NewsSearchModel newsSearchModel = new NewsSearchModel();
		newsSearchModel.keyword = keyword;
		newsSearchModel.page = getCurrentPage(request);
		newsSearchModel.categoryId = super.getInteger(request, "categoryId");
		model.addAttribute("newsSearch", newsService.search(newsSearchModel));
		model.addAttribute("searchModel", newsSearchModel);
		return "admin/news/News";
	}

}
