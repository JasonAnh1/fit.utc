package com.nckh.cnttva1k61.dto;

public class LecturersSearchModel extends BaseSearchModel {
    public String position;
    public String faculty;
    public Integer departmentId;

    public Integer getDepartment_id() {
        return departmentId;
    }

    public void setDepartment_id(Integer department_id) {
        this.departmentId = department_id;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPosition() {
        return position;
    }
}
