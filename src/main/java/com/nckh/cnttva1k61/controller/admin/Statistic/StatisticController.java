package com.nckh.cnttva1k61.controller.admin.Statistic;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.StatisticSearchModel;
import com.nckh.cnttva1k61.services.StatisticService;

@Controller
public class StatisticController extends BaseController{
	@Autowired
	StatisticService statisticService;


@RequestMapping(value = {"admin/Statistic"}, method = RequestMethod.GET)
public String Statistic (final Model model,final HttpServletRequest request,final HttpServletResponse response  )
{
	String keyword = request.getParameter("keyword");
	StatisticSearchModel statisticSearchModel = new StatisticSearchModel();
	statisticSearchModel.keyword = keyword;
	model.addAttribute("statisticSearch", statisticService.search(statisticSearchModel));
	model.addAttribute("statisticSearchModel", statisticSearchModel);
	
	return "admin/statistic/ListStatistic";
}

@RequestMapping(value = { "/admin/addStatistic" }, method = RequestMethod.GET)
public String get_addstatistic(final Model model, final HttpServletRequest request,
                             final HttpServletResponse response) {
    model.addAttribute("Statistic", new com.nckh.cnttva1k61.entities.Statistic());
    	
    return "admin/statistic/AddSatistic";
}

@RequestMapping(value = { "/admin/addStatistic" }, method = RequestMethod.POST)
public String addCategories(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                            @ModelAttribute("Statistic") com.nckh.cnttva1k61.entities.Statistic statistic) throws IOException {

	statisticService.saveOrUpdate(statistic);
    response.sendRedirect("Statistic");
    return "admin/statistic/AddSatistic";
}
@RequestMapping(value = {"admin/deleteStatistic"},method = RequestMethod.GET )
private String post_delete(final Model model,final HttpServletRequest request,
                           final HttpServletResponse response) throws IOException {
    Integer id = Integer.parseInt(request.getParameter("id"));
    statisticService.deleteById(id);
    response.sendRedirect("Statistic");
    return "admin/statistic/ListStatistic";
}


@RequestMapping(value = "/admin/updateStatistic", method = RequestMethod.GET)
public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response) {
    com.nckh.cnttva1k61.entities.Statistic statistic = new com.nckh.cnttva1k61.entities.Statistic();
    Integer id = Integer.parseInt(request.getParameter("cid"));
    statistic = statisticService.getById(id);
    model.addAttribute("Statistic", statistic);
    return "admin/statistic/AddSatistic";
}

@RequestMapping(value = "/admin/updateStatistic", method = RequestMethod.POST)
public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response,
                               @ModelAttribute("Statistic") com.nckh.cnttva1k61.entities.Statistic statistic) throws IOException {
	
	statisticService.saveOrUpdate(statistic);
    response.sendRedirect("Statistic");
    return "admin/statistic/AddSatistic";

}

}
