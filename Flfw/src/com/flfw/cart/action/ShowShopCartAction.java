package com.flfw.cart.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import com.flfw.cart.service.ShopCartService;
import com.opensymphony.xwork2.ActionSupport;



public class ShowShopCartAction extends ActionSupport {
	private ShopCartService shopCartService;
	
	public ShopCartService getShopCartService() {
		return shopCartService;
	}

	public void setShopCartService(ShopCartService shopCartService) {
		this.shopCartService = shopCartService;
	}
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		int userid = (int)request.getSession().getAttribute("userID");
		List list=shopCartService.findAllShopCart(userid);
		request.setAttribute("shop_cart", list);
		return SUCCESS;
		/*List list=shopCartService.findAllShopCart(userid);
		ResultUtils.toJson(ServletActionContext.getResponse(), list);
		JSONArray jsonArray = JSONArray.fromObject(list);  
		ServletActionContext.getResponse().getWriter().write(jsonArray.toString());
	    return NONE;*/
	}
}
