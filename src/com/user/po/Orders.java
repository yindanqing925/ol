package com.user.po;

import javax.persistence.Table;
import java.util.Date;

@Table(name = "ORDERS")
public class Orders {
    private Integer orderid;

    private Integer createdby;

    private Date orderdate;

    private String orderno;

    private Integer ordstatus;

    private Double amount;

    private Integer adress;

    private Integer storeid;

    private Integer confirmby;

    private Date confirmdate;

    private Integer receivedby;

    private Date receiveddate;

    private Integer endby;

    private Date enddate;

    private Short isseen;

    private String ordertips;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno == null ? null : orderno.trim();
    }

    public Integer getOrdstatus() {
        return ordstatus;
    }

    public void setOrdstatus(Integer ordstatus) {
        this.ordstatus = ordstatus;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getAdress() {
        return adress;
    }

    public void setAdress(Integer adress) {
        this.adress = adress;
    }

    public Integer getStoreid() {
        return storeid;
    }

    public void setStoreid(Integer storeid) {
        this.storeid = storeid;
    }

    public Integer getConfirmby() {
        return confirmby;
    }

    public void setConfirmby(Integer confirmby) {
        this.confirmby = confirmby;
    }

    public Date getConfirmdate() {
        return confirmdate;
    }

    public void setConfirmdate(Date confirmdate) {
        this.confirmdate = confirmdate;
    }

    public Integer getReceivedby() {
        return receivedby;
    }

    public void setReceivedby(Integer receivedby) {
        this.receivedby = receivedby;
    }

    public Date getReceiveddate() {
        return receiveddate;
    }

    public void setReceiveddate(Date receiveddate) {
        this.receiveddate = receiveddate;
    }

    public Integer getEndby() {
        return endby;
    }

    public void setEndby(Integer endby) {
        this.endby = endby;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public Short getIsseen() {
        return isseen;
    }

    public void setIsseen(Short isseen) {
        this.isseen = isseen;
    }

    public String getOrdertips() {
        return ordertips;
    }

    public void setOrdertips(String ordertips) {
        this.ordertips = ordertips == null ? null : ordertips.trim();
    }
}