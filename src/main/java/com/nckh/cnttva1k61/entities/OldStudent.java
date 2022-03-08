package com.nckh.cnttva1k61.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "old_student")
public class OldStudent extends BaseEntity{
    @Column(name = "FirstName",length = 300)
    private String firstName;
    @Column(name = "LastName",length = 300)
    private String lastName;
    @Column(name = "faculty",length = 1000)
    private String faculty;
    @Column(name = "day_of_birth")
    private Integer dayOfBirth;
    @Column(name = "month_of_birth")
    private Integer monthOfBirth;
    @Column(name = "year_of_birth")
    private Integer yearOfBirth;
    @Column(name = "company",length = 600)
    private String company;
    @Column(name = "description",columnDefinition = "LONGTEXT")
    private String description;
    @Column(name = "phone_number")
    private Integer phoneNumber;
    @Column(name = "email")
    private String email;

    public String getaCode() {
        return aCode;
    }

    public void setaCode(String aCode) {
        this.aCode = aCode;
    }

    @Column(name = "academic_code")
    private String aCode;
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public Integer getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(Integer dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public Integer getMonthOfBirth() {
        return monthOfBirth;
    }

    public void setMonthOfBirth(Integer monthOfBirth) {
        this.monthOfBirth = monthOfBirth;
    }

    public Integer getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(Integer yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Integer phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
