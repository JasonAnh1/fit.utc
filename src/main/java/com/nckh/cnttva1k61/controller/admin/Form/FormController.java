package com.nckh.cnttva1k61.controller.admin.Form;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.FormSearchModel;
import com.nckh.cnttva1k61.dto.LecturersSearchModel;
import com.nckh.cnttva1k61.entities.Forms;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.services.FormService;
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
public class FormController extends BaseController {
@Autowired
    FormService formService;

    @RequestMapping(value = {"admin/listForms"},method = RequestMethod.GET)
    private String getLectures(final Model model, final HttpServletRequest request,
                               final HttpServletResponse response)throws IOException
    {
        String keyword = request.getParameter("keyword");
        FormSearchModel formSearchModel = new FormSearchModel();
        formSearchModel.keyword = keyword;
        model.addAttribute("formsSearch", formService.search(formSearchModel));
        model.addAttribute("formsSearchModel",formSearchModel);
        return "admin/form/Forms";
    }
    @RequestMapping(value = { "/admin/addForm" }, method = RequestMethod.GET)
    public String get_addproduct(final Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {
        model.addAttribute("forms", new Forms());

        return "admin/form/AddForms";
    }

    @RequestMapping(value = { "/admin/addForm" }, method = RequestMethod.POST)
    public String addCategories(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                                @ModelAttribute("forms") Forms forms, @RequestParam("formLink") MultipartFile formLink) throws IOException {

        formService.add(forms, formLink);
        formService.saveOrUpdate(forms);
        response.sendRedirect("listForms");
        return "admin/form/AddForms";
    }
    @RequestMapping(value = {"admin/deleteForm"},method = RequestMethod.GET )
    private String post_delete(final Model model,final HttpServletRequest request,
                               final HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        formService.deleteById(id);
        response.sendRedirect("listForms");
        return "admin/form/Forms";
    }


    @RequestMapping(value = "/admin/updateForm", method = RequestMethod.GET)
    public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response) {
        Forms forms = new Forms();
        Integer id = Integer.parseInt(request.getParameter("cid"));
        forms = formService.getById(id);
        model.addAttribute("forms", forms);
        return "admin/form/AddForms";
    }

    @RequestMapping(value = "/admin/updateForm", method = RequestMethod.POST)
    public String updateCategories(Model model, HttpServletRequest request, HttpServletResponse response,
                                   @ModelAttribute("forms") Forms forms, @RequestParam("formLink") MultipartFile formLink
                                   ) throws IOException {

        formService.add(forms, formLink);
        formService.saveOrUpdate(forms);
        response.sendRedirect("listForms");
        return "admin/form/AddForms";

    }
}
