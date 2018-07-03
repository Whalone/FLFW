package com.flfw.index.action;

import com.flfw.index.model.MmallProduct;
import com.flfw.index.model.Product;
import com.flfw.index.service.ProductsService;
import com.flfw.index.util.ResultUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.Map;


/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 22:31 2018/6/17
 * @Description:
 */


//@Controller("productsAction")
//@Scope("prototype")
//@Namespace("/index")
//@ParentPackage("index")
public class ProductsAction extends BaseAction<MmallProduct>{
//    @Resource
    private ProductsService productsService;
    private int productId;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    //@Action(value = "ProductsList")//results = {@Result(name = "",type = "", location = "")}
    public String execute() throws Exception{
        ResultUtils.toJson(ServletActionContext.getResponse(), productsService.getCategoryFirstAllProducts());
        return NONE;
    }

    //@Action(value = "ProductSave")//results = {@Result(name = "",type = "", location = "")}
    public String save(){
        productsService.productSave(model);
        return NONE;
    }

    //@Action(value = "ProductUpdate")//results = {@Result(name = "",type = "", location = "")}
    public String update(){
        productsService.productUpdate(model);
        return NONE;
    }

    public String status(){
        HttpServletRequest request = ServletActionContext.getRequest();
        productId = Integer.parseInt(request.getParameter("id"));
        productsService.updateStatus(productId);
        return NONE;
    }
}
