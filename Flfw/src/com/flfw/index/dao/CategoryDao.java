package com.flfw.index.dao;

import com.flfw.index.model.MmallCategory;

import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 15:17 2018/6/7
 * @Description:
 */

public interface CategoryDao {
//    查找所有父商品分类
    List<MmallCategory> getAllParentCategory();
//    查找子类by父分类id
    List<MmallCategory> getChildCategoryByParentId(int id);



}
