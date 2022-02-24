package com.nckh.cnttva1k61.dto;

import com.nckh.cnttva1k61.entities.Categories;

public class CategorySearchModel extends BaseSearchModel {
	public int id;
	public Categories parent_id;
	public String seo;
	public Boolean status;
	public Categories getParent_id() {
		return parent_id;
	}

	public void setParent_id(Categories parent_id) {
		this.parent_id = parent_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
}
