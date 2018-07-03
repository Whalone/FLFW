package com.flfw.index.action;

import com.flfw.index.model.MmallProduct;
import com.flfw.index.service.ProductsService;
import com.flfw.index.util.ResultUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 0:30 2018/6/21
 * @Description:
 */
//@Controller("categoryProductsAction")
//@Scope("prototype")
//@Namespace("/index")
//@ParentPackage("index")
public class CategoryProductAction extends BaseAction<MmallProduct>{
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

    //@Action(value = "CategoryProductsList")//results = {@Result(name = "",type = "", location = "")}
    public String execute() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        categoryId = Integer.parseInt(request.getParameter("id"));
        ResultUtils.toJson(ServletActionContext.getResponse(), productsService.getCategoryProducts(categoryId));
        return NONE;
    }
}
