package com.nckh.cnttva1k61.services;

import com.nckh.cnttva1k61.dto.AboutFitUtcSearchModel;
import com.nckh.cnttva1k61.dto.StatisticSearchModel;
import com.nckh.cnttva1k61.entities.AboutFitUtc;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.entities.Statistic;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;

@Service
public class AboutFitUtcService extends BaseService<AboutFitUtc>{

    @Override
    protected Class<AboutFitUtc> clazz() {
        return AboutFitUtc.class;
    }
    @Transactional
    public AboutFitUtc add(AboutFitUtc p, MultipartFile aboutFitUtcAvatar) throws IllegalStateException, IOException {

        // kiểm tra xem admin có đẩy avatar lên không ???
        if (!isEmptyUploadFile(aboutFitUtcAvatar)) {
            // tạo đường dẫn tới folder chứa avatar
            String pathToFile = UPLOAD_FOLDER_ROOT + "/aboutFitUtc/avatar/" + aboutFitUtcAvatar.getOriginalFilename();

            // lưu avatar vào đường dẫn trên
            aboutFitUtcAvatar.transferTo(new File(pathToFile));

            p.setAvatar("aboutFitUtc/avatar/" + aboutFitUtcAvatar.getOriginalFilename());
        }
        // lưu vào database
        return super.saveOrUpdate(p);
    }
    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }
    @Transactional
    public AboutFitUtc update(AboutFitUtc p, MultipartFile aboutFitUtcAvatar) throws IllegalStateException, IOException {
        AboutFitUtc AboutFitUtcInDb = super.getById(p.getId());
        if (!isEmptyUploadFile(aboutFitUtcAvatar)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FOLDER_ROOT + AboutFitUtcInDb.getAvatar()).delete();

            aboutFitUtcAvatar
                    .transferTo(new File(UPLOAD_FOLDER_ROOT + "/aboutFitUtc/avatar/" + aboutFitUtcAvatar.getOriginalFilename()));
            p.setAvatar("aboutFitUtc/avatar/" + aboutFitUtcAvatar.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            p.setAvatar(AboutFitUtcInDb.getAvatar());
        }
        return super.saveOrUpdate(p);

    }
    public PagerData<AboutFitUtc> search(AboutFitUtcSearchModel searchModel) {
        String sql = "SELECT * FROM tbl_about_fit_utc p WHERE 1=1 ";

        if (searchModel != null) {
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (p.Name like '%" + searchModel.keyword + "%'"+ " or p.detail like '%"
                        + searchModel.keyword + "%')";
            }
        }
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
    }
}
