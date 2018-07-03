package com.flfw.order.service;

import java.util.List;

import com.flfw.order.model.Order;
import com.flfw.order.model.OrderItem;
import com.flfw.order.model.Shipping;

public interface OrderService {
//	增加对象
	public void add(Object object);
	
//	更新对象
	public void update(Object object);
	
//	删除对象
	public void delete(Object object);

//	查询订单(根据用户id)
	public List<Order> findOrderByUserid(Integer user_id);
	
// 查询订单(根据订单状态和顾客ID)
	public List<Order> findOrderByOrderState(Integer orderStatus,Integer user_id);
	
//	根据订单id修改订单状态
	public void updateOrderStatus(String order_no,int status);
	
//	更新用户订单列表(根据用户id)
	public void updateAllOrderByUserid();
	
//	查询地址(根据用户id)
	public List<Shipping> findShippingByUserid(Integer user_id);

	//	删除地址(根据用户id)
	public void deleteShipping(Integer id);
}
