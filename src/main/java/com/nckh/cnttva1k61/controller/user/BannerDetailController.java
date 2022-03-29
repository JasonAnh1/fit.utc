package com.nckh.cnttva1k61.controller.user;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.entities.Banner;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.services.BannerService;
import com.nckh.cnttva1k61.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class BannerDetailController extends BaseController {
    @Autowired
    BannerService bannerService;
    @Autowired
    CategoryService categoryService;
    @RequestMapping(value = "DetailBanner", method = RequestMethod.GET)
    public String DetailBanner(Model model, HttpServletRequest request, HttpServletResponse response) {
        Banner banner = new Banner();
        Integer id = Integer.parseInt(request.getParameter("cid"));
        banner = bannerService.getById(id);
        model.addAttribute("banner", banner);
        return "user/bannerDetail";
    }
}
