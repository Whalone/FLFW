package com.flfw.order.controler;

import java.util.List;

import com.flfw.order.model.Order;
import com.flfw.order.model.OrderItem;
import com.flfw.order.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FindOrderListAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private OrderService orderService;
	

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

//	查找用户所有订单(根据id)
	public String QueryHistoryOrderList(){
		ActionContext ac=ActionContext.getContext();	//获得ActionContext对象
		//ac.getSession().put("user_id", 12);
		int user_id=(int)ac.getSession().get("userID");	//获取用户id
		System.out.println("这是用户id："+user_id);
		List<Order> orderListbyHistory=orderService.findOrderByUserid(user_id);
		if(!orderListbyHistory.isEmpty()){	//判空 有待解决
			System.out.println("订单列表不为空");
 			ac.getSession().put("orderListbyHistory",orderListbyHistory);
			return SUCCESS;
		}else{
			System.out.println("订单列表为空！");
			addActionError("<tr height='70px'><td align='center' colspan='8'><font color='#BF4D4D'>您好！您没有下任何订单！ </font></td></tr>");
			return INPUT;
		}
		
	}

}
