package com.flfw.index.service;

import com.flfw.index.model.CategoryList;
import com.flfw.index.model.MmallCategory;

import java.util.List;
import java.util.Map;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 17:01 2018/6/7
 * @Description:
 */
public interface CategoryService extends BaseService<MmallCategory> {


//    查询所有父分类
    List<MmallCategory> getAllParentCategory();
//    按父分类查询组合所有子类
    List<CategoryList> getAllCategorySortByParentId();
//    获取每一个分类下第一个子分类
    List<Integer> getParentFirstChildId();
}
