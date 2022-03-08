package com.nckh.cnttva1k61.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_form")
public class Forms extends BaseEntity {
    @Column(name = "name", length = 1000)
    private String name;
    @Column(name = "tutorial", length = 1500)
    private String tutorial;
    @Column(name = "link", length = 1500)
    private String link;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTutorial() {
        return tutorial;
    }

    public void setTutorial(String tutorial) {
        this.tutorial = tutorial;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
