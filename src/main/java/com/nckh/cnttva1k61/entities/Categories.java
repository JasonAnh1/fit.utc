package com.nckh.cnttva1k61.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tbl_category")
public class Categories extends BaseEntity {
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	@Column(name = "description", length = 100, nullable = false)
	private String description;
	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "categories")
	private Set<News> newss = new HashSet<News>();

	public void addProduct(News news) {
		newss.add(news);
		news.setCategories(this);
	}


	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	private Categories parent;
	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "parent")
	private Set<Categories> childs = new HashSet<Categories>();
	public void addChild(Categories category) {
		this.childs.add(category);
		category.setParent(this);
	}
	public void deleteChild(Categories category) {
		this.childs.remove(category);
		category.setParent(null);
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Categories getParent() {
		return parent;
	}

	public void setParent(Categories parent) {
		this.parent = parent;
	}

	public Set<Categories> getChilds() {
		return childs;
	}

	public void setChilds(Set<Categories> childs) {
		this.childs = childs;
	}

	public Set<News> getNewss() {
		return newss;
	}

	public void setNewss(Set<News> newss) {
		this.newss = newss;
	}
	

}
