package com.nckh.cnttva1k61.controller.admin.about;

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
import com.nckh.cnttva1k61.dto.AboutFitUtcSearchModel;
import com.nckh.cnttva1k61.entities.AboutFitUtc;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.services.AboutFitUtcService;

@Controller
public class AboutFitUtcController extends BaseController{
@Autowired
AboutFitUtcService aboutFitUtcService;


@RequestMapping(value = {"admin/aboutFitutc"}, method = RequestMethod.GET)
public String aboutFit (final Model model,final HttpServletRequest request,final HttpServletResponse response  )
{
	String keyword = request.getParameter("keyword");
	AboutFitUtcSearchModel aboutFitUtcSearchModel = new AboutFitUtcSearchModel();
	aboutFitUtcSearchModel.keyword = keyword;
	model.addAttribute("aboutFitUtcSearch", aboutFitUtcService.search(aboutFitUtcSearchModel));
	model.addAttribute("aboutFitUtcSearchModel", aboutFitUtcSearchModel);
	
	return "admin/about/ListAbout";
}

@RequestMapping(value = { "/admin/addAboutfitutc" }, method = RequestMethod.GET)
public String get_addproduct(final Model model, final HttpServletRequest request,
                             final HttpServletResponse response) {
    model.addAttribute("AboutFitUtc", new AboutFitUtc());
    	
    return "admin/about/AddAbout";
}

@RequestMapping(value = { "/admin/addAboutfitutc" }, method = RequestMethod.POST)
public String addCategories(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                            @ModelAttribute("AboutFitUtc") AboutFitUtc aboutFitUtc, @RequestParam("aboutAvatar") MultipartFile aboutAvatar) throws IOException {

	aboutFitUtcService.add(aboutFitUtc, aboutAvatar);
	aboutFitUtcService.saveOrUpdate(aboutFitUtc);
    response.sendRedirect("aboutFitutc");
    return "admin/about/AddAbout";
}
@RequestMapping(value = {"admin/deleteAboutfitutc"},method = RequestMethod.GET )
private String post_delete(final Model model,final HttpServletRequest request,
                           final HttpServletResponse response) throws IOException {
    Integer id = Integer.parseInt(request.getParameter("id"));
    aboutFitUtcService.deleteById(id);
    response.sendRedirect("aboutFitutc");
    return "admin/about/ListAbout";
}


@RequestMapping(value = "/admin/updateAboutfitutc", method = RequestMethod.GET)
public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response) {
    AboutFitUtc aboutFitUtc = new AboutFitUtc();
    Integer id = Integer.parseInt(request.getParameter("cid"));
    aboutFitUtc = aboutFitUtcService.getById(id);
    model.addAttribute("AboutFitUtc", aboutFitUtc);
    return "admin/about/AddAbout";
}

@RequestMapping(value = "/admin/updateAboutfitutc", method = RequestMethod.POST)
public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response,
                               @ModelAttribute("AboutFitUtc") AboutFitUtc aboutFitUtc, @RequestParam("aboutAvatar") MultipartFile aboutAvatar
                              ) throws IOException {

	aboutFitUtcService.add(aboutFitUtc, aboutAvatar);
	aboutFitUtcService.saveOrUpdate(aboutFitUtc);
    response.sendRedirect("aboutFitutc");
    return "admin/about/AddAbout";

}


}

















