package com.nckh.cnttva1k61.controller.admin.sponsor;

import com.nckh.cnttva1k61.controller.BaseController;
import com.nckh.cnttva1k61.dto.LecturersSearchModel;
import com.nckh.cnttva1k61.dto.SponsorSearchModel;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.entities.OldStudent;
import com.nckh.cnttva1k61.entities.Sponsor;
import com.nckh.cnttva1k61.services.SponsorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class sponsorController extends BaseController {
@Autowired  SponsorService sponsorService;

    @RequestMapping(value = {"admin/listSponsor"},method = RequestMethod.GET)
    private String getSponsor(final Model model, final HttpServletRequest request,
                               final HttpServletResponse response)throws IOException
    {
        String keyword = request.getParameter("keyword");
        SponsorSearchModel sponsorSearchModel = new SponsorSearchModel();
        sponsorSearchModel.keyword = keyword;
        model.addAttribute("sponsorSearch", sponsorService.search(sponsorSearchModel));
        model.addAttribute("sponsorSearchModel",sponsorSearchModel);
        return "admin/sponsor/Sponsor";
    }
    @RequestMapping(value = { "/admin/addSponsor" }, method = RequestMethod.GET)
    public String get_addSponsor(final Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {
        model.addAttribute("sponsor", new Sponsor());

        return "admin/sponsor/addSponsor";
    }

    @RequestMapping(value = { "/admin/addSponsor" }, method = RequestMethod.POST)
    public String post_addsponsor(final Model model, final HttpServletRequest request, final HttpServletResponse response,
                                @ModelAttribute("sponsor") Sponsor sponsor, @RequestParam("sponsorAvatar") MultipartFile sponsorAvatar) throws IOException {

        sponsorService.add(sponsor, sponsorAvatar);
        sponsorService.saveOrUpdate(sponsor);
        response.sendRedirect("listSponsor");
        return "admin/sponsor/addSponsor";
    }
    @RequestMapping(value = { "/admin/updateSponsor" }, method = RequestMethod.GET)
    public String get_updateSponsor(final Model model, final HttpServletRequest request,
                                 final HttpServletResponse response) {
        Sponsor sponsor2 = new Sponsor();
        Integer id = Integer.parseInt(request.getParameter("cid"));
        sponsor2 = sponsorService.getById(id);
        model.addAttribute("sponsor", sponsor2);
        return "admin/sponsor/updateSponsor";
    }
    @RequestMapping(value = "/admin/updateSponsor", method = RequestMethod.POST)
    public String updateSpon(Model model, HttpServletRequest request, HttpServletResponse response,
                                   @ModelAttribute("sponsor") Sponsor sponsor, @RequestParam("sponsorAvatar") MultipartFile sponsorAvatar) throws IOException {

        sponsorService.update(sponsor, sponsorAvatar);
        sponsorService.saveOrUpdate(sponsor);
        response.sendRedirect("listSponsor");
        return "admin/sponsor/updateSponsor";

    }
    @PostMapping( value = {"/admin/ajax/delete/Sponsor/{id}"})
    public ResponseEntity<Sponsor> delete (Model model,@PathVariable("id") Integer id, HttpServletResponse response)
    { 
    	Sponsor sponsor = this.sponsorService.getById(id); 
    	if(sponsor != null)
    	{
    		if(sponsor.getStatus() == true)
    		{
    			sponsor.setStatus(false);
    			this.sponsorService.saveOrUpdate(sponsor);
    		}
    	}
    	
    	return ResponseEntity.ok(sponsor);
    }
    @PostMapping( value = {"/admin/ajax/active/Sponsor/{id}"})
    public ResponseEntity<Sponsor> active (Model model,@PathVariable("id") Integer id, HttpServletResponse response)
    { 
    	Sponsor sponsor = this.sponsorService.getById(id); 
    	if(sponsor != null)
    	{
    		if(sponsor.getStatus() == false)
    		{
    			sponsor.setStatus(true);
    			this.sponsorService.saveOrUpdate(sponsor);
    		}
    	}
    	
    	return ResponseEntity.ok(sponsor);
    }

}
