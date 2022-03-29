package com.nckh.cnttva1k61.dto;

public class DepartmentSearchModel extends BaseSearchModel {
    public int id;
    public String seo;
    public Boolean status;

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
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
}
