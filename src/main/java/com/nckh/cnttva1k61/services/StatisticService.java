package com.nckh.cnttva1k61.services;

import com.nckh.cnttva1k61.dto.OldStudentSearchModel;
import com.nckh.cnttva1k61.dto.StatisticSearchModel;
import com.nckh.cnttva1k61.entities.OldStudent;
import com.nckh.cnttva1k61.entities.Statistic;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class StatisticService extends BaseService<Statistic>{
    @Override
    protected Class<Statistic> clazz() {
        return Statistic.class;
    }
    public PagerData<Statistic> search(StatisticSearchModel searchModel) {
        String sql = "SELECT * FROM tbl_statistic p WHERE 1=1 ";

        if (searchModel != null) {
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql += " and (p.name like '%" + searchModel.keyword + "%'"+ " or p.data like '%"
                        + searchModel.keyword + "%'"+ "or p.description like '%" + searchModel.keyword
            + "%')";
            }
        }
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
    }
}
