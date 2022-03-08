package com.nckh.cnttva1k61.controller.admin.events;

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
import com.nckh.cnttva1k61.dto.EventSearchModel;
import com.nckh.cnttva1k61.entities.Events;
import com.nckh.cnttva1k61.services.EventService;

@Controller
public class EventsController extends BaseController {
	@Autowired
	EventService eventsService;
	@RequestMapping(value = { "/admin/listEvents" }, method = RequestMethod.GET)
	public String get_listEvents(final Model model, final HttpServletRequest request,
			final HttpServletResponse response)

	{
		String keyword = request.getParameter("keyword");

		EventSearchModel eventSearchModel = new EventSearchModel();
		eventSearchModel.keyword = keyword;
		eventSearchModel.page = getCurrentPage(request);
		model.addAttribute("eventsSearch", eventsService.search(eventSearchModel));
		model.addAttribute("searchModel", eventSearchModel);
		return "admin/events/Events";
	}
	@RequestMapping(value = { "/admin/addEvents" }, method = RequestMethod.GET)
	public String get_addproduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("events", new Events());

		return "admin/events/AddEvents";
	}

	@RequestMapping(value = { "/admin/addEvents" }, method = RequestMethod.POST)
	public String addCategories(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("events") Events events, @RequestParam("eventsAvatar") MultipartFile eventsAvatar) throws IOException {
		eventsService.add(events, eventsAvatar);
		eventsService.saveOrUpdate(events);
		response.sendRedirect("listEvents");
		return "admin/events/AddEvents";
	}
	@RequestMapping(value = "/admin/updateEvents", method = RequestMethod.GET)
	public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response) {
		Events events = new Events();
		Integer id = Integer.parseInt(request.getParameter("cid"));
		events = eventsService.getById(id);
		model.addAttribute("events", events);
//gui danh sach categories xuong view
		return "admin/events/UpdateEvents";
	}

	@RequestMapping(value = "/admin/updateEvents", method = RequestMethod.POST)
	public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("events") Events events, @RequestParam("eventsAvatar") MultipartFile eventsAvatar) throws IOException {
		eventsService.update(events, eventsAvatar);
		eventsService.saveOrUpdate(events);

		response.sendRedirect("listEvents");
		return "admin/events/UpdateEvents";

	}
	@RequestMapping(value = {"admin/deleteEvents"},method = RequestMethod.GET )
	private String post_delete(final Model model,final HttpServletRequest request,
							   final HttpServletResponse response) throws IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		eventsService.deleteById(id);
		response.sendRedirect("listEvents");
		return "admin/events/Events";
	}

}
