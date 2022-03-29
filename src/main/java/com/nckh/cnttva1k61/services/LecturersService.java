package com.nckh.cnttva1k61.services;

import com.nckh.cnttva1k61.components.Utilities;
import com.nckh.cnttva1k61.dto.LecturersSearchModel;
import com.nckh.cnttva1k61.dto.NewsSearchModel;
import com.nckh.cnttva1k61.entities.Events;
import com.nckh.cnttva1k61.entities.Lecturers;
import com.nckh.cnttva1k61.entities.News;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;

@Service
public class LecturersService extends BaseService<Lecturers>{
    @Override
    protected Class<Lecturers> clazz() {
        return Lecturers.class;
    }
    @Transactional
    public Lecturers add(Lecturers p, MultipartFile lecturersAvatar) throws IllegalStateException, IOException {

        // kiểm tra xem admin có đẩy avatar lên không ???
        if (!isEmptyUploadFile(lecturersAvatar)) {
            // tạo đường dẫn tới folder chứa avatar
            String pathToFile = UPLOAD_FOLDER_ROOT + "/lecturers/avatar/" + lecturersAvatar.getOriginalFilename();

            // lưu avatar vào đường dẫn trên
            lecturersAvatar.transferTo(new File(pathToFile));

            p.setAvatar("lecturers/avatar/" + lecturersAvatar.getOriginalFilename());
        }
        // lưu vào database
        return super.saveOrUpdate(p);
    }
    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }
    @Transactional
    public Lecturers update(Lecturers p, MultipartFile lecturersAvatar) throws IllegalStateException, IOException {
        Lecturers LecturersInDb = super.getById(p.getId());
        if (!isEmptyUploadFile(lecturersAvatar)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FOLDER_ROOT + LecturersInDb.getAvatar()).delete();

            lecturersAvatar
                    .transferTo(new File(UPLOAD_FOLDER_ROOT + "/lecturers/avatar/" + lecturersAvatar.getOriginalFilename()));
            p.setAvatar("lecturers/avatar/" + lecturersAvatar.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            p.setAvatar(LecturersInDb.getAvatar());
        }
        return super.saveOrUpdate(p);

    }
    public PagerData<Lecturers> search(LecturersSearchModel searchModel) {
        String sql = "SELECT * FROM tbl_lecturers p WHERE 1=1 ";

        if (searchModel != null) {
            if (searchModel.departmentId != null && searchModel.departmentId > 0) {
                sql += " and department_id =' " + searchModel.departmentId + " '";
            }
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (p.name like '%" + searchModel.keyword + "%'" + " or p.introduce like '%"
                        + searchModel.keyword + "%' "+ " or p.position like '%"
                        + searchModel.keyword + "%' " + " or p.teaching like '%" + searchModel.keyword + "%')";
            }if(searchModel.faculty != null ){
                sql+= " and (p.faculty = '" + searchModel.faculty + "')";
            }
        }
        sql += "ORDER BY p.name";
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
    }
}
