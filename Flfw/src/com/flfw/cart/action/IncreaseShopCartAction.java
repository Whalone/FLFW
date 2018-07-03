package com.flfw.cart.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.flfw.cart.model.MmallCart;
import com.flfw.cart.service.ShopCartService;
import com.opensymphony.xwork2.ActionSupport;

public class IncreaseShopCartAction extends ActionSupport {
	private ShopCartService shopCartService;
	public ShopCartService getShopCartService() {
		return shopCartService;
	}
	public void setShopCartService(ShopCartService shopCartService) {
		this.shopCartService = shopCartService;
	}
	public String execute() throws Exception{
		int userId,productId,quantity;
		HttpServletRequest request = ServletActionContext.getRequest();
		userId = (int)request.getSession().getAttribute("userID");
		if (userId>0){
			try{
				productId=Integer.parseInt(request.getParameter("productId"));
				quantity=Integer.parseInt(request.getParameter("quantity"));
			}catch(Exception e){
				throw new Exception(e.getMessage());
			}
			shopCartService.AddCart_product(userId, productId, quantity);
			return SUCCESS;
		}else {
			return "login";
		}

	}
}
