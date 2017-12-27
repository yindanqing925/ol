package com.user.mapper;

import com.user.po.Attributes;

public interface AttributesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Attributes record);

    int insertSelective(Attributes record);

    Attributes selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attributes record);

    int updateByPrimaryKey(Attributes record);
}