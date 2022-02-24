package com.nckh.cnttva1k61.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.EventSearchModel;
import com.nckh.cnttva1k61.dto.NewsSearchModel;
import com.nckh.cnttva1k61.entities.Events;
import com.nckh.cnttva1k61.services.EventService;
import com.nckh.cnttva1k61.services.NewsService;
import com.nckh.cnttva1k61.services.PagerData;
@Controller
public class EventsDetailController extends BaseController {
	@Autowired
	EventService eventService;
	@Autowired 
	NewsService newsService;
	@RequestMapping(value = { "/detailE/{seo}" }, method = RequestMethod.GET)
	public String detailEvents(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse respone, @PathVariable("seo") String seo) throws IOException {
		EventSearchModel eventSearchModel = new EventSearchModel();
		NewsSearchModel newsSearchModel = new NewsSearchModel();
		eventSearchModel.seo = seo;
		PagerData<Events> pagerData = eventService.listSeo(eventSearchModel);
		Events events = pagerData.getData().get(0);
		model.addAttribute("events", events);
		model.addAttribute("listEvents",eventService.listEvents(eventSearchModel));
		model.addAttribute("fourNews",newsService.FourLastNews(newsSearchModel));
		// mvc duoc cau hinh chi dinh vao thu muc /scr/main/webapp/web-ìn/views
		// de tim cac views
		// /web-INF/views/user/index.jsp
		return "user/eventsDetail";
	}
}
