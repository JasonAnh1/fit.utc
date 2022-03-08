package com.nckh.cnttva1k61.controller.admin.oldStudent;

import com.nckh.cnttva1k61.controller.BaseController;

import com.nckh.cnttva1k61.dto.OldStudentSearchModel;

import com.nckh.cnttva1k61.entities.OldStudent;
import com.nckh.cnttva1k61.services.OldStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class OldStudentController extends BaseController {
@Autowired
    OldStudentService oldStudentService ;
    @RequestMapping(value = {"admin/listOldStudent"},method = RequestMethod.GET)
    private String getStdents(final Model model, final HttpServletRequest request,
                               final HttpServletResponse response)throws IOException
    {
        String keyword = request.getParameter("keyword");
        OldStudentSearchModel oldStudentSearchModel = new OldStudentSearchModel();
        oldStudentSearchModel.keyword = keyword;
        model.addAttribute("oldStudentSearch", oldStudentService.search2(oldStudentSearchModel));
        model.addAttribute("oldStudentSearchModel",oldStudentSearchModel);
        return "admin/oldStudent/OldStudent";
    }

    @RequestMapping(value = { "/admin/addOldStudent" }, method = RequestMethod.GET)
    public String get_addOldStudent(final Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {
        model.addAttribute("oldStudent", new OldStudent());

        return "admin/oldStudent/AddOldStudent";
    }

    @RequestMapping(value = { "/admin/addOldStudent" }, method = RequestMethod.POST)
    public String post_addOldStudent(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                                @ModelAttribute("oldStudent") OldStudent oldStudent) throws IOException {

        oldStudentService.saveOrUpdate(oldStudent);
        response.sendRedirect("listOldStudent");
        return "admin/oldStudent/AddOldStudent";
    }
}
