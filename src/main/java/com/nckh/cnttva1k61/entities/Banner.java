package com.nckh.cnttva1k61.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tbl_banner")
public class Banner extends BaseEntity{
	@Column(name = "title", length = 1000, nullable = false)
	private String title;
	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDes;
	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String details;
	@Column(name = "avatar",length = 200, nullable = true)
	private String avatar;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
       
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Categories categories;
	
	@JsonIgnore 
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "banner")
	private Set<BannerImages> bannerImages = new HashSet<BannerImages>();
	public void addBannerImages(BannerImages _bannerImages) {
		_bannerImages.setBanner(this);
		bannerImages.add(_bannerImages);
	}
	public void deleteBannerImages(BannerImages _bannerImages) {
		_bannerImages.setBanner(null);
		bannerImages.remove(_bannerImages);
	}
	public void setCategories(Categories categories) {
		this.categories = categories;
	}
	

	public String getShortDes() {
		return shortDes;
	}
	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getSeo() {
		return seo;
	}
	public Set<BannerImages> getBannerImages() {
		return bannerImages;
	}
	public void setBannerImages(Set<BannerImages> bannerImages) {
		this.bannerImages = bannerImages;
	}
	public void setSeo(String seo) {
		this.seo = seo;
	}
	public Categories getCategories() {
		return categories;
	}
//	public Set<NewsImages> getNewsImages() {
//		return newsImages;
//	}
//	public void setNewsImages(Set<NewsImages> newsImages) {
//		this.newsImages = newsImages;
//	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}
	
}
