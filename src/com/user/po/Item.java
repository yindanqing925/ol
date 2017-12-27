package com.user.po;

import javax.persistence.Table;

@Table(name = "ITEM")
public class Item {
    private Integer id;

    private String orderno;

    private String productno;

    private Double prrice;

    private Integer quantity;

    private Double total;

    private Integer createdby;

    private Integer updatedby;

    private String itemyips;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno == null ? null : orderno.trim();
    }

    public String getProductno() {
        return productno;
    }

    public void setProductno(String productno) {
        this.productno = productno == null ? null : productno.trim();
    }

    public Double getPrrice() {
        return prrice;
    }

    public void setPrrice(Double prrice) {
        this.prrice = prrice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public Integer getUpdatedby() {
        return updatedby;
    }

    public void setUpdatedby(Integer updatedby) {
        this.updatedby = updatedby;
    }

    public String getItemyips() {
        return itemyips;
    }

    public void setItemyips(String itemyips) {
        this.itemyips = itemyips == null ? null : itemyips.trim();
    }
}