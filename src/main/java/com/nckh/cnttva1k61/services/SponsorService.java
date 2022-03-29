package com.nckh.cnttva1k61.services;

import com.nckh.cnttva1k61.dto.LecturersSearchModel;
import com.nckh.cnttva1k61.dto.SponsorSearchModel;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.entities.Sponsor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
@Service
public class SponsorService extends BaseService<Sponsor>{
    @Override
    protected Class<Sponsor> clazz() {
        return Sponsor.class;
    }
    @Transactional
    public Sponsor add(Sponsor p, MultipartFile sponsorAvatar) throws IllegalStateException, IOException {

        // kiểm tra xem admin có đẩy avatar lên không ???
        if (!isEmptyUploadFile(sponsorAvatar)) {
            // tạo đường dẫn tới folder chứa avatar
            String pathToFile = UPLOAD_FOLDER_ROOT + "/sponsor/avatar/" + sponsorAvatar.getOriginalFilename();

            // lưu avatar vào đường dẫn trên
            sponsorAvatar.transferTo(new File(pathToFile));

            p.setAvatar("sponsor/avatar/" + sponsorAvatar.getOriginalFilename());
        }
        // lưu vào database
        return super.saveOrUpdate(p);
    }
    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }
    @Transactional
    public Sponsor update(Sponsor p, MultipartFile sponsorAvatar) throws IllegalStateException, IOException {
        Sponsor sponsorInDB = super.getById(p.getId());
        if (!isEmptyUploadFile(sponsorAvatar)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FOLDER_ROOT + sponsorInDB.getAvatar()).delete();

            sponsorAvatar
                    .transferTo(new File(UPLOAD_FOLDER_ROOT + "/sponsor/avatar/" + sponsorAvatar.getOriginalFilename()));
            p.setAvatar("sponsor/avatar/" + sponsorAvatar.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            p.setAvatar(sponsorInDB.getAvatar());
        }
        return super.saveOrUpdate(p);

    }
    public PagerData<Sponsor> search(SponsorSearchModel searchModel) {
        String sql = "SELECT * FROM tbl_sponsor p WHERE 1=1 ";

        if (searchModel != null) {
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (p.nameSpon like '%" + searchModel.keyword + "%'"+ " or p.contact like '%"
                        + searchModel.keyword + "%' " + " or p.email like '%" + searchModel.keyword + "%')";
            }
        }
        sql += "ORDER BY p.indexSpon";
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
    }
}
