package com.nckh.cnttva1k61.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.BannerSearchModel;
import com.nckh.cnttva1k61.dto.CategorySearchModel;
import com.nckh.cnttva1k61.dto.EventSearchModel;
import com.nckh.cnttva1k61.dto.NewsSearchModel;
import com.nckh.cnttva1k61.entities.Categories;
import com.nckh.cnttva1k61.entities.Events;
import com.nckh.cnttva1k61.entities.News;
import com.nckh.cnttva1k61.entities.NewsImages;
import com.nckh.cnttva1k61.services.BannerService;
import com.nckh.cnttva1k61.services.CategoryService;
import com.nckh.cnttva1k61.services.EventService;
import com.nckh.cnttva1k61.services.NewsImagesService;
import com.nckh.cnttva1k61.services.NewsService;
import com.nckh.cnttva1k61.services.PagerData;

@Controller
public class IndexController extends BaseController {
	@Autowired
	NewsService newsService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	BannerService bannerService;
	@Autowired
	EventService eventService;
	@Autowired
	NewsImagesService newsImagesService;

	@RequestMapping(value = { "/index" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse respone)
			throws IOException {
		NewsSearchModel newsSearchModel = new NewsSearchModel();
		BannerSearchModel bannerSearchModel = new BannerSearchModel();
		EventSearchModel eventSearchModel = new EventSearchModel();
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("fourNews", newsService.FourLastNews(newsSearchModel));
		model.addAttribute("fourBanner", bannerService.FourLastBanner(bannerSearchModel));
		model.addAttribute("listEvents", eventService.listEvents(eventSearchModel));
		model.addAttribute("twoEdu", newsService.TwoLastEducateNews(newsSearchModel));
		model.addAttribute("twoContact", newsService.TwoLastContactNews(newsSearchModel));
		// mvc duoc cau hinh chi dinh vao thu muc /scr/main/webapp/web-ìn/views
		// de tim cac views
		// /web-INF/views/user/index.jsp
		return "user/index";
	}

	@RequestMapping(value = { "/detail/{seo}" }, method = RequestMethod.GET)
	public String detailNews(final ModelMap model, final HttpServletRequest request, final HttpServletResponse respone,
			@PathVariable("seo") String seo) throws IOException {

		EventSearchModel eventSearchModel = new EventSearchModel();
		NewsSearchModel newsSearchModel = new NewsSearchModel();
		CategorySearchModel categorySearchModel = new CategorySearchModel();
		CategorySearchModel categorySearchModel2 = new CategorySearchModel();

		newsSearchModel.seo = seo;
		PagerData<News> pagerData = newsService.listSeo(newsSearchModel);
		News news = pagerData.getData().get(0);

		Categories categories = news.getCategories();
		categorySearchModel.id = categories.getId();
		PagerData<Categories> data = categoryService.findById(categorySearchModel);
		Categories categories2 = data.getData().get(0);

		Categories categories3 = categories2.getParent();
		categorySearchModel2.id = categories3.getId();
		PagerData<Categories> data2 = categoryService.findById(categorySearchModel2);
		Categories categories4 = data2.getData().get(0);

		model.addAttribute("news", news);
		model.addAttribute("categories2", categories2);
		model.addAttribute("categories4", categories4);
		List<NewsImages> list = newsImagesService.findAll();
		model.addAttribute("listimg", list);
		model.addAttribute("listEvents", eventService.listEvents(eventSearchModel));
		model.addAttribute("fourNews", newsService.FourLastNews(newsSearchModel));
		// mvc duoc cau hinh chi dinh vao thu muc /scr/main/webapp/web-ìn/views
		// de tim cac views
		// /web-INF/views/user/index.jsp
		return "user/newDetail";
	}

	@RequestMapping(value = { "/category/{id}" }, method = RequestMethod.GET)
	public String list_news(final ModelMap model, final HttpServletRequest request, final HttpServletResponse respone,
			@PathVariable("id") Integer id) throws IOException {
		NewsSearchModel newsSearchModel = new NewsSearchModel();
		newsSearchModel.categoryId = id;
		PagerData<News> pagerData = newsService.listByCategoryId(newsSearchModel);
		model.addAttribute("news", pagerData);

		return "user/category";
	}
	@RequestMapping(value = { "/news" }, method = RequestMethod.GET)
	public String list_news2(final ModelMap model, final HttpServletRequest request, final HttpServletResponse respone) throws IOException {
		NewsSearchModel newsSearchModel = new NewsSearchModel();
		PagerData<News> pagerData = newsService.search(newsSearchModel);
		model.addAttribute("news", pagerData);

		return "user/listNews";
	}
	@RequestMapping(value = { "/ListEvents" }, method = RequestMethod.GET)
	public String list_events(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		EventSearchModel eventSearchModel = new EventSearchModel();
		PagerData<Events> pagerData = eventService.search(eventSearchModel);
		model.addAttribute("events", pagerData);
		
		return "user/listEvents";
	}

}