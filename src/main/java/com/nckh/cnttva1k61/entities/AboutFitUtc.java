package com.nckh.cnttva1k61.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_about_fit_utc")
public class AboutFitUtc extends BaseEntity{
    @Column(name = "detail",columnDefinition = "LONGTEXT")
    private String detail;
    @Column(name = "avatar",length = 500)
    private String avatar;
    @Column(name = "name",length = 500)
    private String name;
    @Column(name = "des",length = 100)
    private String des;

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
