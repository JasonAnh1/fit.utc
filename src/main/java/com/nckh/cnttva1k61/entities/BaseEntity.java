package com.nckh.cnttva1k61.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import jdk.jfr.BooleanFlag;

@MappedSuperclass
public class BaseEntity {
	@Id //primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) //auto increment
	@Column(name = "id")
	private Integer id;
    @BooleanFlag
	@Column(name = "status", nullable = true)
	private Boolean status = Boolean.TRUE;

	@Column(name = "created_by",length = 50, nullable = true)
	private String createdBy;

	@Column(name = "updated_by",length = 50, nullable = true)
	private String updatedBy;
    
	@Column(name = "created_date", nullable = true)
	private Date createdDate = new Date();

	@Column(name = "updated_date", nullable = true)
	private Date updatedDate = new Date();
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}



	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
}
