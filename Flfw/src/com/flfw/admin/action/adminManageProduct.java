package com.flfw.admin.action;

import com.flfw.index.service.ProductsService;
import com.flfw.index.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 14:27 2018/6/23
 * @Description:
 */
//@Controller("adminManageProduct")
//@Scope("prototype")
//@Namespace("/admin")
//@ParentPackage("admin")
public class adminManageProduct extends ActionSupport {
    //@Resource
    private ProductsService productsService;

    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    private int categoryId;

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    //@Action(value = "adminProduct")//results = {@Result(name = "",type = "", location = "")}
    public String execute() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        categoryId = Integer.parseInt(request.getParameter("id"));
        ResultUtils.toJson(ServletActionContext.getResponse(), productsService.adminCategoryProduct(categoryId));
        return NONE;
    }

}
