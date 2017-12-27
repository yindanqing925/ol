package com.user.mapper;

import com.user.po.Attributesinfo;

public interface AttributesinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Attributesinfo record);

    int insertSelective(Attributesinfo record);

    Attributesinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attributesinfo record);

    int updateByPrimaryKey(Attributesinfo record);
}