package com.flfw.order.dao;

import java.util.List;

import com.flfw.order.model.Order;
import com.flfw.order.model.Shipping;

public interface OrderDao {
//	保存对象
	public void save(Object object);
	
//	更新对象
	public void update(Object object);
	
//	删除对象
	public void delete(Object object);
	
//	提供一个字段及字段值，返回List
	public List findByOneProperty(String className,String property,Object value);
	
//	提供两个字段及字段值，返回List
	public List findByTwoProperty(String className,String property1,String property2,Object value1,Object value2);
	
//	通过订单号获取实体
	public Order findOrderByOrderno(String orderno);
	
//	查地址表
	public List findShippingbyUser(Integer value);

	//	通过id获取地址实体
	public Shipping findShippingByid(Integer id);
	
}
