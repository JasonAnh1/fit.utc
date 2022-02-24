package com.nckh.cnttva1k61.services;



import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.nckh.cnttva1k61.components.Utilities;
import com.nckh.cnttva1k61.dto.CategorySearchModel;
import com.nckh.cnttva1k61.dto.NewsSearchModel;
import com.nckh.cnttva1k61.entities.Categories;
import com.nckh.cnttva1k61.entities.News;

@Service
public class CategoryService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}

	public PagerData<Categories> search(CategorySearchModel searchModel) {
		String sql = "SELECT * FROM tbl_category p WHERE 1=1";


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
	public PagerData<Categories>findById(CategorySearchModel searchModel) {
		String sql = "SELECT * FROM tbl_category    WHERE tbl_category.id ='" +searchModel.id +"'";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
	public PagerData<Categories>findByChildId(CategorySearchModel searchModel) {
		String sql = "SELECT * FROM tbl_category    WHERE tbl_category.id ='" +searchModel.parent_id +"'";
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page);
	}
	public Categories add(Categories p) {
		
		p.setSeo(Utilities.slugify(p.getName()));
		return super.saveOrUpdate(p);
	}
public Categories update(Categories p) {
		
		
		p.setSeo(Utilities.slugify(p.getName()));
		return super.saveOrUpdate(p);
	}

}
