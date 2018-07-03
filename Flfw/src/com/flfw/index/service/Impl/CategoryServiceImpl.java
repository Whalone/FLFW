package com.flfw.index.service.Impl;

import com.flfw.index.dao.CategoryDao;
import com.flfw.index.model.CategoryList;
import com.flfw.index.model.MmallCategory;
import com.flfw.index.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.Id;
import java.util.*;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 16:09 2018/6/7
 * @Description:
 */
//@Service("categoryService")

public class CategoryServiceImpl extends BaseServiceImpl<MmallCategory> implements CategoryService{
    //@Resource
    private CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    //    查询所有父分类
    public List<MmallCategory> getAllParentCategory(){
        return categoryDao.getAllParentCategory();
    }

    //    按父分类查询组合所有子类
    public List<CategoryList> getAllCategorySortByParentId(){
        List<MmallCategory> parentList = this.getAllParentCategory();
        List<CategoryList> CategoryList = new ArrayList<>();

        for(Iterator iterator = parentList.iterator();iterator.hasNext();){
            MmallCategory parentCategory = (MmallCategory)iterator.next();//父ID
            List<MmallCategory> childList = categoryDao.getChildCategoryByParentId(parentCategory.getId());//子List

            List<MmallCategory> commonChildList = new ArrayList<>();
            for(Iterator iterator1 = childList.iterator();iterator1.hasNext();){
                MmallCategory childCategory = (MmallCategory)iterator1.next();//处理输入子数据
                commonChildList.add(new MmallCategory(childCategory.getId(),childCategory.getName()));
            }

            CategoryList.add(new CategoryList(parentCategory.getId(),parentCategory.getName(),commonChildList));
        }
        return CategoryList;
    }

    //获取每一个分类下第一个子分类
    public List<Integer> getParentFirstChildId(){
        List<Integer> IDlist = new ArrayList<>();
        List<CategoryList> CategoryList = this.getAllCategorySortByParentId();
        for (Iterator iterator = CategoryList.iterator();iterator.hasNext();){
            CategoryList parentCategory = (CategoryList)iterator.next();
            if (parentCategory.getChildList().isEmpty()){
                IDlist.add(0);
            }else{
                IDlist.add(parentCategory.getChildList().get(0).getId());
            }

        }
        return IDlist;
    }
}
