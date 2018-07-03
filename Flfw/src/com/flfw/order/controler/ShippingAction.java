package com.flfw.order.controler;

import java.util.List;

import com.flfw.order.model.Shipping;
import com.flfw.order.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class ShippingAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8932205959241269096L;
	
	private OrderService orderService;
	private Shipping shipping;
	

	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
 
	public String QueryShippingByUser(){
		ActionContext ac=ActionContext.getContext();	//获得ActionContext对象
		//ac.getSession().put("user_id", 12);
		int user_id=(int)ac.getSession().get("userID");
		List<Shipping> shippingList=orderService.findShippingByUserid(user_id);
		ac.getSession().put("shippingList", shippingList);
		return SUCCESS;
	}
	
	public String AddShipping(){
		ActionContext ac=ActionContext.getContext();	//获得ActionContext对象
		//ac.getSession().put("user_id", 12);
		int user_id=(int)ac.getSession().get("userID");
		shipping.setUser_id(user_id);
		orderService.add(shipping);
		List<Shipping> shippingList=orderService.findShippingByUserid(user_id);
		ac.getSession().put("shippingList", shippingList);
		System.out.println("添加地址");
		return SUCCESS;
	}

	public String DeleteShipping(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int shippingid=Integer.parseInt(request.getParameter("shippingid"));
		orderService.deleteShipping(shippingid);
		int user_id=(int)request.getSession().getAttribute("userID");
		List<Shipping> shippingList=orderService.findShippingByUserid(user_id);
		request.getSession().setAttribute("shippingList", shippingList);
		return SUCCESS;
	}
	
}
