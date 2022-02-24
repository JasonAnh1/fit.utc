package com.nckh.cnttva1k61.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_banner_img")
public class BannerImages extends BaseEntity{
	@Column(name = "title", nullable = false)
	private String title;

	@Column(name = "path", nullable = false)
	private String path;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "banner_id")
	private Banner banner;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Banner getBanner() {
		return banner;
	}

	public void setBanner(Banner banner) {
		this.banner = banner;
	}


}
