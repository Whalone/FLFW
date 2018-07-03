package com.flfw.order.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.flfw.order.dao.OrderDao;
import com.flfw.order.model.Order;
import com.flfw.order.model.OrderItem;
import com.flfw.order.model.Shipping;
import com.flfw.order.service.OrderService;
import com.opensymphony.xwork2.ActionContext;


public class OrderServiceImpl implements OrderService {
	private static final String orderClassName="Order";
	private static final String orderColumnName1="user_id";
	private static final String orderColumnName2="status";
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

//	增加对象
	@Transactional
	@Override
	public void add(Object object) {
		// TODO Auto-generated method stub
		orderDao.save(object);
	}
	
//	更新对象
	@Transactional
	public void update(Object object){
		orderDao.update(object);
	}
	
//	删除对象
	@Transactional
	public void delete(Object object){
		orderDao.delete(object);
	}
	
//	查询订单(根据用户id)
	public List<Order> findOrderByUserid(Integer user_id){
		 List<Order> list=orderDao.findByOneProperty(orderClassName, orderColumnName1, user_id);
		System.out.println("进入了OrderServiceImpl");
		/*for(Order o:list){
			System.out.println(o.getOrder_no());
			for(OrderItem i:o.getOrderItems()){
				System.out.println(i.getProduct_id());
			}
		}*/
		return list;
	}
	
// 查询订单(根据订单状态和顾客ID)
	public List<Order> findOrderByOrderState(Integer orderStatus,Integer user_id){
		List<Order> list=orderDao.findByTwoProperty(orderClassName, orderColumnName1, orderColumnName2, user_id, orderStatus);
		return list;
	}
	
//	根据订单id修改订单状态
	@Transactional
	public void updateOrderStatus(String order_no,int status){
		Order order=orderDao.findOrderByOrderno(order_no);
		order.setStatus(status);
		orderDao.update(order);
	}
	
//	更新用户订单列表(根据用户id)
	@Transactional
	public void updateAllOrderByUserid(){
		ActionContext ac=ActionContext.getContext();//获得ActionContext对象
		ac.getSession().remove("orderListbyHistory");
		int user_id=(int)ac.getSession().get("userID");	//获取用户id
		System.out.println("这是用户id："+user_id);
		List<Order> orderListbyHistory=findOrderByUserid(user_id);
		ac.getSession().put("orderListbyHistory",orderListbyHistory);
	}
	
//	查询地址(根据用户id)
	public List<Shipping> findShippingByUserid(Integer user_id){
		List<Shipping> list=orderDao.findShippingbyUser(user_id);
		return list;
		
	}

	//	删除地址(根据用户id)
	@Transactional
	public void deleteShipping(Integer id){
		Shipping shipping=orderDao.findShippingByid(id);
		orderDao.delete(shipping);
		System.out.println("删除地址。。。对应地址id为："+id);
	}


}
