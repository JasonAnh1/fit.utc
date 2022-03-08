package com.nckh.cnttva1k61.services;

import com.nckh.cnttva1k61.dto.FormSearchModel;
import com.nckh.cnttva1k61.dto.LecturersSearchModel;
import com.nckh.cnttva1k61.entities.Forms;
import com.nckh.cnttva1k61.entities.Lecturers;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;

@Service
public class FormService extends BaseService<Forms> {
    @Override
    protected Class<Forms> clazz() {
        return Forms.class;
    }
    @Transactional
    public Forms add(Forms p, MultipartFile formLink) throws IllegalStateException, IOException {

        // kiểm tra xem admin có đẩy avatar lên không ???
        if (!isEmptyUploadFile(formLink)) {
            // tạo đường dẫn tới folder chứa avatar
            String pathToFile = UPLOAD_FOLDER_ROOT + "/form/link/" + formLink.getOriginalFilename();

            // lưu avatar vào đường dẫn trên
            formLink.transferTo(new File(pathToFile));

            p.setLink("form/link/" + formLink.getOriginalFilename());
        }
        // lưu vào database
        return super.saveOrUpdate(p);
    }
    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }
    @Transactional
    public Forms update(Forms p, MultipartFile formLink) throws IllegalStateException, IOException {
        Forms FormsInDb = super.getById(p.getId());
        if (!isEmptyUploadFile(formLink)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FOLDER_ROOT + FormsInDb.getLink()).delete();

            formLink
                    .transferTo(new File(UPLOAD_FOLDER_ROOT + "/form/link/" + formLink.getOriginalFilename()));
            p.setLink("form/link/" + formLink.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            p.setLink(FormsInDb.getLink());
        }
        return super.saveOrUpdate(p);

    }

    public PagerData<Forms> search(FormSearchModel searchModel) {
        String sql = "SELECT * FROM tbl_form p WHERE 1=1 ";

        if (searchModel != null) {
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (p.name like '%" + searchModel.keyword + "%'" + " or p.tutorial like '%"
                        + searchModel.keyword + "%' ";
            }
        }
        sql += "ORDER BY p.created_date";
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
    }

}
