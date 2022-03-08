package com.nckh.cnttva1k61.services;

import com.nckh.cnttva1k61.dto.FormSearchModel;
import com.nckh.cnttva1k61.dto.OldStudentSearchModel;
import com.nckh.cnttva1k61.entities.Forms;
import com.nckh.cnttva1k61.entities.OldStudent;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;

@Service
public class OldStudentService extends BaseService<OldStudent> {

    @Override
    protected Class<OldStudent> clazz() {
        return OldStudent.class;
    }

    public PagerData<OldStudent> search2(OldStudentSearchModel searchModel) {
        String sql = "SELECT * FROM old_student p WHERE 1=1 ";

        if (searchModel != null) {
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (p.LastName like '%" + searchModel.keyword + "%'"+ " or p.FirstName like '%"
                        + searchModel.keyword + "%' )";
            }
        }
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
    }
}
