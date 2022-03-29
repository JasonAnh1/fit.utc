package com.nckh.cnttva1k61.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sponsor")
public class Sponsor extends BaseEntity {
    @Column(name = "nameSpon", length = 500)
    private String name;
    @Column(name = "email", length = 500)
    private String email;
    @Column(name = "contact", length = 1100)
    private String contact;
    @Column(name = "indexSpon")
    private Integer index;
    @Column(name = "avatar")
    private String avatar;
    @Column(name = "description",columnDefinition = "LONGTEXT")
    private String description;
    @Column(name = "donated",columnDefinition = "LONGTEXT")
    private String donated;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDonated() {
        return donated;
    }

    public void setDonated(String donated) {
        this.donated = donated;
    }
}
