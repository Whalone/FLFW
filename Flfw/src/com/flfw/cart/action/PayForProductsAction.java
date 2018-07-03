package com.flfw.cart.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.flfw.order.model.Shipping;
import com.flfw.order.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;

import com.flfw.cart.service.ShopCartService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;

public class PayForProductsAction extends ActionSupport {
	private ShopCartService shopCartService;
	private OrderService orderService;
	private String Cartlist;
	private String Payfor_price;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String getCartlist() {
		return Cartlist;
	}

	public void setCartlist(String cartlist) {
		Cartlist = cartlist;
	}

	public String getPayfor_price() {
		return Payfor_price;
	}

	public void setPayfor_price(String payfor_price) {
		Payfor_price = payfor_price;
	}

	public ShopCartService getShopCartService() {
		return shopCartService;
	}
	public void setShopCartService(ShopCartService shopCartService) {
		this.shopCartService = shopCartService;
	}
	public String execute() throws Exception{
		int userId;
		String Id,product_Id,product_name,product_subtitle,product_quantity,product_price,product_image,product_allprice;
		HttpServletRequest request = ServletActionContext.getRequest();
		userId = (int)request.getSession().getAttribute("userID");

		Cartlist=request.getParameter("ProductsList");
		JSONArray JsonArray1 = JSONArray.fromObject(Cartlist);
		System.out.println(JsonArray1);
		List<String[]> AllproductList=new ArrayList<String[]>();
		Payfor_price=request.getParameter("Payfor_price");
		System.out.println(Payfor_price);
		for(int i = 0 ; i < JsonArray1.size() ; i++){
			//Id,product_Id,product_name,product_quantity,product_price,product_image,product_allprice,Payfor_price;
			 JSONArray JsonArray2 = JSONArray.fromObject(JsonArray1.get(i));
			 Id = JsonArray2.get(0).toString();
			 product_Id = JsonArray2.get(1).toString();
			 product_name=JsonArray2.get(2).toString();
			 product_subtitle=JsonArray2.get(3).toString();
			 product_quantity=JsonArray2.get(4).toString();
			 product_price=JsonArray2.get(5).toString();
			 product_image=JsonArray2.get(6).toString();
			 product_allprice=JsonArray2.get(7).toString();
			 String[] Stringlist=new String[8];
			 Stringlist[0]=Id;
			 Stringlist[1]=product_Id;
			 Stringlist[2]=product_name;
			 Stringlist[3]=product_subtitle;
			 Stringlist[4]=product_quantity;
			 Stringlist[5]=product_price;
			 Stringlist[6]=product_image;
			 Stringlist[7]=product_allprice;
			 System.out.println("商品信息："+Stringlist);
			 AllproductList.add(Stringlist);
         }
		System.out.print("全部商品："+AllproductList.get(0)[0]);
		System.out.print("全部商品："+AllproductList.get(0)[1]);
		HttpSession session = request.getSession();
		session.setAttribute("payfor_list",AllproductList);
		session.setAttribute("Payfor_price",Payfor_price);

		ActionContext ac=ActionContext.getContext();	//获得ActionContext对象
		//ac.getSession().put("user_id", userId);
		//int user_id=(int)ac.getSession().get("user_id");
		List<Shipping> shippingList=orderService.findShippingByUserid(userId);
		ac.getSession().put("shippingList", shippingList);
		/*
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.getRequestDispatcher("/pay.jsp").forward(request, response);*/
		return SUCCESS;
	}
}
