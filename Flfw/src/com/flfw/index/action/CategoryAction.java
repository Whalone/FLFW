package com.flfw.index.action;

import com.flfw.index.model.MmallCategory;
import com.flfw.index.service.CategoryService;
import com.flfw.index.service.Impl.CategoryServiceImpl;
import com.flfw.index.util.ResultUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.annotations.Parent;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 16:11 2018/6/7
 * @Description:
 */
//@Controller("categoryAction")
//@Scope("prototype")
//@Namespace("/index")
//@ParentPackage("index")
public class CategoryAction extends BaseAction<MmallCategory>{
    //@Resource
    private CategoryService categoryService;

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    //@Action(value = "CategoryList")//results = {@Result(name = "",type = "", location = "")}
    public String execute() throws Exception{
        ResultUtils.toJson(ServletActionContext.getResponse(), categoryService.getAllCategorySortByParentId());
        return NONE;
    }

}
