package com.nckh.cnttva1k61.controller.admin.lecturers;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.LecturersSearchModel;
import com.nckh.cnttva1k61.entities.Events;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.entities.News;
import com.nckh.cnttva1k61.services.LecturersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Controller
public class LecturersController extends BaseController {
    @Autowired
    LecturersService lecturersService;

@RequestMapping(value = {"admin/listlecturers"},method = RequestMethod.GET)
private String getLectures(final Model model, final HttpServletRequest request,
                           final HttpServletResponse response)throws IOException
{
    String keyword = request.getParameter("keyword");
    LecturersSearchModel lecturersSearchModel = new LecturersSearchModel();
    lecturersSearchModel.keyword = keyword;
    model.addAttribute("lecturersSearch", lecturersService.search(lecturersSearchModel));
    model.addAttribute("lecturersSearchModel",lecturersSearchModel);
    return "admin/lecturers/ListLecturers";
}
    @RequestMapping(value = { "/admin/addLecturer" }, method = RequestMethod.GET)
    public String get_addproduct(final Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {
        model.addAttribute("lecturer", new Lecturers());

        return "admin/lecturers/AddLecturers";
    }

    @RequestMapping(value = { "/admin/addLecturer" }, method = RequestMethod.POST)
    public String addCategories(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                                @ModelAttribute("lecturer") Lecturers lecturers, @RequestParam("lecturersAvatar") MultipartFile lecturersAvatar) throws IOException {

        lecturersService.add(lecturers, lecturersAvatar);
        lecturersService.saveOrUpdate(lecturers);
        response.sendRedirect("listlecturers");
        return "admin/lecturers/AddLecturers";
    }
    @RequestMapping(value = {"admin/deleteLecturer"},method = RequestMethod.GET )
    private String post_delete(final Model model,final HttpServletRequest request,
                               final HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        lecturersService.deleteById(id);
        response.sendRedirect("listlecturers");
        return "admin/lecturers/ListLecturers";
    }


    @RequestMapping(value = "/admin/updateLecturers", method = RequestMethod.GET)
    public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response) {
        Lecturers lecturers = new Lecturers();
        Integer id = Integer.parseInt(request.getParameter("cid"));
        lecturers = lecturersService.getById(id);
        model.addAttribute("lecturer", lecturers);
        return "admin/lecturers/AddLecturers";
    }

    @RequestMapping(value = "/admin/updateLecturers", method = RequestMethod.POST)
    public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response,
                                   @ModelAttribute("lecturer") Lecturers lecturers, @RequestParam("lecturersAvatar") MultipartFile lecturersAvatar,
                                   @RequestParam("newsPictures") MultipartFile[] newsPictures) throws IOException {

        lecturersService.add(lecturers, lecturersAvatar);
        lecturersService.saveOrUpdate(lecturers);
        response.sendRedirect("listlecturers");
        return "admin/lecturers/AddLecturers";

    }


}
