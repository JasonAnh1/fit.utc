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
@Table(name = "tbl_news")
public class News extends BaseEntity {
	@Column(name = "title", length = 1000, nullable = false)
	private String title;
	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDes;
    @Column(name = "is_hot",nullable = true)
    private Boolean isHot = Boolean.FALSE;
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
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "news")
	private Set<NewsImages> newsImages = new HashSet<NewsImages>();
	public void addNewsImages(NewsImages _newsImages) {
		_newsImages.setNews(this);
		newsImages.add(_newsImages);
	}
	public void deleteNewsImages(NewsImages _newsImages) {
		_newsImages.setNews(null);
		newsImages.remove(_newsImages);
	}
	public void setCategories(Categories categories) {
		this.categories = categories;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getShortDes() {
		return shortDes;
	}
	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}
	public Boolean getIsHot() {
		return isHot;
	}
	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
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
	public void setSeo(String seo) {
		this.seo = seo;
	}
	public Categories getCategories() {
		return categories;
	}
	public Set<NewsImages> getNewsImages() {
		return newsImages;
	}
	public void setNewsImages(Set<NewsImages> newsImages) {
		this.newsImages = newsImages;
	}
	
	
}
