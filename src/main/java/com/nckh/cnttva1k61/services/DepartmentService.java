package com.nckh.cnttva1k61.services;

import com.nckh.cnttva1k61.components.Utilities;
import com.nckh.cnttva1k61.dto.CategorySearchModel;
import com.nckh.cnttva1k61.dto.DepartmentSearchModel;
import com.nckh.cnttva1k61.entities.Categories;
import com.nckh.cnttva1k61.entities.Department;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
@Service
public class DepartmentService extends BaseService<Department> {

    @Override
    protected Class<Department> clazz() {
        return Department.class;
    }

    public PagerData<Department> search(DepartmentSearchModel searchModel) {
        String sql = "SELECT * FROM tbl_department p WHERE 1=1";

        if (!StringUtils.isEmpty(searchModel.seo)) {
            sql += " and p.seo ='" + searchModel.seo + "'";
        }
        if (!StringUtils.isEmpty(searchModel.keyword)) {
            sql += " and (p.name like '%" + searchModel.keyword + "%'" + " or p.description like '%"
                    + searchModel.keyword + "%' )";
        }
        if (searchModel.status != null) {
            sql += " and p.status = '" + searchModel.status + "'";
        }

        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);

    }
    public Department add(Department p) {

        p.setSeo(Utilities.slugify(p.getName()));
        return super.saveOrUpdate(p);
    }

    public Department update(Department p) {


        p.setSeo(Utilities.slugify(p.getName()));
        return super.saveOrUpdate(p);
    }
}
