package com.user.po;

import javax.persistence.Table;

@Table(name = "CHANNEL")
public class Channel {
    private Integer id;

    private String type;

    private String maintain;

    private String tips;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getMaintain() {
        return maintain;
    }

    public void setMaintain(String maintain) {
        this.maintain = maintain == null ? null : maintain.trim();
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips == null ? null : tips.trim();
    }
}