package com.user.mapper;

import com.user.po.Job;

public interface JobMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Job record);

    int insertSelective(Job record);

    Job selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
}