package com.nckh.cnttva1k61.controller.admin.banner;

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
import com.nckh.cnttva1k61.dto.BannerSearchModel;
import com.nckh.cnttva1k61.entities.Banner;
import com.nckh.cnttva1k61.services.BannerService;
import com.nckh.cnttva1k61.services.CategoryService;

@Controller
public class BannerController extends BaseController {
	@Autowired
	BannerService bannerService;
	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = { "/admin/listBanner" }, method = RequestMethod.GET)
	public String get_listBanner(final Model model, final HttpServletRequest request,
			final HttpServletResponse response)

	{
		String keyword = request.getParameter("keyword");

		BannerSearchModel bannerSearchModel = new BannerSearchModel();
		bannerSearchModel.keyword = keyword;
		bannerSearchModel.page = getCurrentPage(request);
		bannerSearchModel.categoryId = super.getInteger(request, "categoryId");
		model.addAttribute("bannerSearch", bannerService.search(bannerSearchModel));
		model.addAttribute("searchModel", bannerSearchModel);
		return "admin/banner/Banner";
	}

//	them

	@RequestMapping(value = { "/admin/addBanner" }, method = RequestMethod.GET)
	public String get_addBanner(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("banner", new Banner());
//gui danh sach categories xuong view
		model.addAttribute("categories", categoryService.findAll());

		return "admin/banner/AddBanner";
	}

	@RequestMapping(value = { "/admin/addBanner" }, method = RequestMethod.POST)
	public String addBanner(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("banner") Banner banner, @RequestParam("bannerAvatar") MultipartFile bannerAvatar,
			@RequestParam("bannerPictures") MultipartFile[] bannerPictures) throws IOException {
		bannerService.add(banner, bannerAvatar, bannerPictures);
		bannerService.saveOrUpdate(banner);
		response.sendRedirect("listBanner");
		return "admin/banner/AddBanner";
	}

	@RequestMapping(value = { "admin/deleteBanner" }, method = RequestMethod.GET)
	private String post_delete(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		bannerService.deleteById(id);
		response.sendRedirect("listBanner");
		return "admin/banner/Banner";

	}

	@RequestMapping(value = "/admin/updateBanner", method = RequestMethod.GET)
	public String updateBanner(Model model, HttpServletRequest request, HttpServletResponse response) {
		Banner banner = new Banner();
		Integer id = Integer.parseInt(request.getParameter("cid"));
		banner = bannerService.getById(id);
		model.addAttribute("banner", banner);
//gui danh sach categories xuong view
		model.addAttribute("categories", categoryService.findAll());
		return "admin/banner/UpdateBanner";
	}

	@RequestMapping(value = "/admin/updateBanner", method = RequestMethod.POST)
	public String updateBanner(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("banner") Banner banner, @RequestParam("bannerAvatar") MultipartFile bannerAvatar,
			@RequestParam("bannerPictures") MultipartFile[] bannerPictures) throws IOException {
		bannerService.update(banner, bannerAvatar, bannerPictures);
		bannerService.saveOrUpdate(banner);

		response.sendRedirect("listBanner");
		return "admin/banner/UpdateBanner";

	}

}
