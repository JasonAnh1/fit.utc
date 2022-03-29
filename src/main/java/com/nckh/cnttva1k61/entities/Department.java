package com.nckh.cnttva1k61.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.engine.internal.Cascade;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

import com.nckh.cnttva1k61.entities.Lecturers;

@Entity
@Table(name = "tbl_department")
public class Department extends BaseEntity {
    @Column(name = "name", length = 500, nullable = false)
    private String name;
    @Column(name = "description", columnDefinition = "LONGTEXT")
    private String Des;
    @Column(name = "short_description", length = 500)
    private String ShortDes;
    @Column(name = "seo", length = 1000, nullable = true)
    private String seo;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "department")
    private Set<Lecturers> lecturers = new HashSet<Lecturers>();

    public Set<Lecturers> getLecturers() {
        return lecturers;
    }

    public void setLecturers(Set<Lecturers> lecturers) {
        this.lecturers = lecturers;
    }

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return Des;
    }

    public void setDes(String des) {
        Des = des;
    }

    public String getShortDes() {
        return ShortDes;
    }

    public void setShortDes(String shortDes) {
        ShortDes = shortDes;
    }

}
