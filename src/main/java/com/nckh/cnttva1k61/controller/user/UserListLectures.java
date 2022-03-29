package com.nckh.cnttva1k61.controller.user;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.LecturersSearchModel;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.services.DepartmentService;
import com.nckh.cnttva1k61.services.LecturersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class UserListLectures extends BaseController {
    @Autowired
    LecturersService lecturersService;
    @Autowired
    DepartmentService departmentService;

    @RequestMapping(value = {"Userlistlecturers"}, method = RequestMethod.GET)
    private String getLectures(final Model model, final HttpServletRequest request,
                               final HttpServletResponse response) throws IOException {
        String keyword = request.getParameter("keyword");
        String faculty = request.getParameter("faculty");
        LecturersSearchModel lecturersSearchModel = new LecturersSearchModel();
        lecturersSearchModel.keyword = keyword;
        lecturersSearchModel.faculty = faculty;
        lecturersSearchModel.departmentId = super.getInteger(request,"departmentId");
        model.addAttribute("lecturersSearch", lecturersService.search(lecturersSearchModel));
        model.addAttribute("lecturersSearchModel", lecturersSearchModel);
        model.addAttribute("department", departmentService.findAll());
        return "user/ListLectures";
    }

    @RequestMapping(value = {"DetailLectures"}, method = RequestMethod.GET)
    private String getDetailLectures(final Model model, final HttpServletRequest request,
                                     final HttpServletResponse response) {
        Lecturers lecturers = new Lecturers();
        Integer id = Integer.parseInt(request.getParameter("cid"));
        lecturers = lecturersService.getById(id);
        model.addAttribute("lecturer", lecturers);
        return "user/DetailLectures";
    }

}
