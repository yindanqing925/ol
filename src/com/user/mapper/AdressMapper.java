package com.user.mapper;

import com.user.po.Adress;

public interface AdressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Adress record);

    int insertSelective(Adress record);

    Adress selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Adress record);

    int updateByPrimaryKey(Adress record);
}