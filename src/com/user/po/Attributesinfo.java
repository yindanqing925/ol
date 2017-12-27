package com.user.po;

import javax.persistence.Table;

@Table(name = "ATTRIBUTESINFO")
public class Attributesinfo {
    private Integer id;

    private String attributename;

    private String attrtips;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAttributename() {
        return attributename;
    }

    public void setAttributename(String attributename) {
        this.attributename = attributename == null ? null : attributename.trim();
    }

    public String getAttrtips() {
        return attrtips;
    }

    public void setAttrtips(String attrtips) {
        this.attrtips = attrtips == null ? null : attrtips.trim();
    }
}