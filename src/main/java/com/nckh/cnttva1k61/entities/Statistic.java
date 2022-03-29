package com.nckh.cnttva1k61.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_statistic")
public class Statistic extends BaseEntity{
    @Column(name = "name",length = 500)
    private String name;
    @Column(name = "data",length = 500)
    private String data;
    @Column(name = "description",length = 500)
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
