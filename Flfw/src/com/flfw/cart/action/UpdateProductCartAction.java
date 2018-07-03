package com.flfw.cart.action;

import java.sql.Array;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.flfw.cart.dao.hibernate.ShopCartDaoImpl;
import com.flfw.cart.json.Json_Transformation;
import com.flfw.cart.service.ShopCartService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class UpdateProductCartAction extends ActionSupport {
	private ShopCartService shopCartService;
	public ShopCartService getShopCartService() {
		return shopCartService;
	}
	public void setShopCartService(ShopCartService shopCartService) {
		this.shopCartService = shopCartService;
	}
	public String execute() throws Exception{
		int userId;
		HttpServletRequest request = ServletActionContext.getRequest();
		userId = (int)request.getSession().getAttribute("userID");
		int del_Id=Integer.parseInt(request.getParameter("del_Id"));
		if (del_Id!=0){
			System.out.println(del_Id);
			shopCartService.delete_ProductCart(del_Id);
		}
		String Cartlist=request.getParameter("ProductList");
		JSONArray JsonArray1 = JSONArray.fromObject(Cartlist);
		System.out.println(JsonArray1);
		for(int i = 0 ; i < JsonArray1.size() ; i++){
			 JSONArray JsonArray2 = JSONArray.fromObject(JsonArray1.get(i));
			 int Id = Integer.valueOf(JsonArray2.get(0).toString());
             int productId = Integer.valueOf(JsonArray2.get(1).toString());
             System.out.print("需要更新的数据产品Id:"+productId+"更改数量为:");
             int quantity = Integer.valueOf(JsonArray2.get(2).toString());
             System.out.println(quantity);
             shopCartService.update_ProductCart(Id,userId,quantity);
             
         }
		return SUCCESS;
	}
}
