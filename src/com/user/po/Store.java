package com.user.po;

import javax.persistence.Table;
import java.util.Date;

@Table(name = "STORE")
public class Store {
    private Integer id;

    private String storename;

    private Integer storeowner;

    private Double amounts;

    private Double amountsmon;

    private Date created;

    private String adress;

    private String channel;

    private String tips;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStorename() {
        return storename;
    }

    public void setStorename(String storename) {
        this.storename = storename == null ? null : storename.trim();
    }

    public Integer getStoreowner() {
        return storeowner;
    }

    public void setStoreowner(Integer storeowner) {
        this.storeowner = storeowner;
    }

    public Double getAmounts() {
        return amounts;
    }

    public void setAmounts(Double amounts) {
        this.amounts = amounts;
    }

    public Double getAmountsmon() {
        return amountsmon;
    }

    public void setAmountsmon(Double amountsmon) {
        this.amountsmon = amountsmon;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress == null ? null : adress.trim();
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel == null ? null : channel.trim();
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips == null ? null : tips.trim();
    }
}