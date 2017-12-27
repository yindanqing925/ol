package com.user.po;

import javax.persistence.Table;

@Table(name = "ATTRIBUTES")
public class Attributes {
    private Integer id;

    private String productno;

    private Integer attributeid;

    private String attributes;

    private Integer isused;

    private String tips;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductno() {
        return productno;
    }

    public void setProductno(String productno) {
        this.productno = productno == null ? null : productno.trim();
    }

    public Integer getAttributeid() {
        return attributeid;
    }

    public void setAttributeid(Integer attributeid) {
        this.attributeid = attributeid;
    }

    public String getAttributes() {
        return attributes;
    }

    public void setAttributes(String attributes) {
        this.attributes = attributes == null ? null : attributes.trim();
    }

    public Integer getIsused() {
        return isused;
    }

    public void setIsused(Integer isused) {
        this.isused = isused;
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips == null ? null : tips.trim();
    }
}