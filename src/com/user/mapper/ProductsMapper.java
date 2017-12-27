package com.user.mapper;

import com.user.po.Products;

public interface ProductsMapper {
    int insert(Products record);

    int insertSelective(Products record);
}