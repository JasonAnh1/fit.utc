package com.nckh.cnttva1k61.dto;

public class BannerSearchModel extends BaseSearchModel {
	public Integer categoryId;

	public String seo;

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
}
