package com.flfw.index.action;

import com.flfw.index.model.Product;
import com.flfw.index.service.ProductsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 13:35 2018/6/20
 * @Description:
 */
//@Controller("productSendAction")
//@Scope("prototype")
//@Namespace("/")
//@ParentPackage("index")
public class productSendAction extends ActionSupport {
    //@Resource
    private ProductsService productsService;

    private int productId;

    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }


    //@Action(value = "product!send",results = {@Result(name = "send", location = "/product.jsp")})//
    public String send() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        productId = Integer.parseInt(request.getParameter("id"));
        Product product = productsService.getbyId(productId);
        ActionContext actionContext = ActionContext.getContext();
        actionContext.put("product",product);
        return "send";
    }
    //@Action(value = "product!add",results = {@Result(name = "add", location = "/product_add.jsp")})//
    public String add(){
        return "add";
    }
    //@Action(value = "product!edit",results = {@Result(name = "edit", location = "/product_edit.jsp")})//
    public String edit(){
        HttpServletRequest request = ServletActionContext.getRequest();
        productId = Integer.parseInt(request.getParameter("id"));
        Product product = productsService.getbyId(productId);
        ActionContext actionContext = ActionContext.getContext();
        actionContext.put("product",product);
        return "edit";
    }
}