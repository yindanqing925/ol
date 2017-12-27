package com.user.po;

import javax.persistence.Table;
import java.util.Date;

@Table(name = "PRODUCTS")
public class Products {
    private Integer id;

    private String productno;

    private Integer createdby;

    private Date createddate;

    private String productname;

    private Double price;

    private String prodintro;

    private String proddetail;

    private Integer updatedby;

    private String updateddate;

    private Integer isseen;

    private Integer attributes;

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

    public Integer getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public Date getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Date createddate) {
        this.createddate = createddate;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getProdintro() {
        return prodintro;
    }

    public void setProdintro(String prodintro) {
        this.prodintro = prodintro == null ? null : prodintro.trim();
    }

    public String getProddetail() {
        return proddetail;
    }

    public void setProddetail(String proddetail) {
        this.proddetail = proddetail == null ? null : proddetail.trim();
    }

    public Integer getUpdatedby() {
        return updatedby;
    }

    public void setUpdatedby(Integer updatedby) {
        this.updatedby = updatedby;
    }

    public String getUpdateddate() {
        return updateddate;
    }

    public void setUpdateddate(String updateddate) {
        this.updateddate = updateddate == null ? null : updateddate.trim();
    }

    public Integer getIsseen() {
        return isseen;
    }

    public void setIsseen(Integer isseen) {
        this.isseen = isseen;
    }

    public Integer getAttributes() {
        return attributes;
    }

    public void setAttributes(Integer attributes) {
        this.attributes = attributes;
    }
}