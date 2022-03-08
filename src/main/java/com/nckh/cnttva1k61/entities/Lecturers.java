package com.nckh.cnttva1k61.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_lecturers")
public class Lecturers extends BaseEntity {
    @Column(name = "name", length = 1000, nullable = true)
    private String name;
    @Column(name = "position", length = 1000)
    private String position;
    @Column(name = "introduce", columnDefinition = "LONGTEXT")
    private String introduce;
    @Column(name = "scientific_work", columnDefinition = "LONGTEXT")
    private String scientific;
    @Column(name = "teaching", columnDefinition = "LONGTEXT")
    private String teaching;
    @Column(name = "field_of_research", columnDefinition = "LONGTEXT")
    private String research;
    @Column(name = "email", length = 1000)
    private String email;
    @Column(name = "avatar", length = 200, nullable = true)
    private String avatar;
    @Column(name = "faculty", length = 200, nullable = true)
    private String faculty;

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getScientific() {
        return scientific;
    }

    public void setScientific(String scientific) {
        this.scientific = scientific;
    }

    public String getTeaching() {
        return teaching;
    }

    public void setTeaching(String teaching) {
        this.teaching = teaching;
    }

    public String getResearch() {
        return research;
    }

    public void setResearch(String research) {
        this.research = research;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
