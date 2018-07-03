package com.flfw.order.dao.impl;

import java.util.List;

import com.flfw.order.model.Shipping;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.flfw.order.dao.OrderDao;
import com.flfw.order.model.Order;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

//	保存对象
	@Override
	public void save(Object object) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(object);
	}
	
//	更新对象
	public void update(Object object){
		getHibernateTemplate().update(object);
	}
	
//	删除对象
	public void delete(Object object){
		getHibernateTemplate().delete(object);
	}
	
//	提供一个字段及字段值，返回List
	public List findByOneProperty(String className,String property,Object value){
		String queryString="from "+className+" as model where model."+property+"='"+value+"' and status!=1 "+"order by create_time desc";
		List results=getHibernateTemplate().find(queryString);
		System.out.println(queryString);
		return results;
	}
	
//	提供两个字段及字段值，返回List
	public List findByTwoProperty(String className,String property1,String property2,Object value1,Object value2){
		String queryString="from "+className+" as model where model."+property1+"='"+value1+"' and model."
							+property2+"='"+value2+"' order by create_time desc";
		List results=getHibernateTemplate().find(queryString);
		System.out.println(queryString);
		return results;
	}
	
//	通过订单号获取实体
	public Order findOrderByOrderno(String orderno){
		Order order=(Order)getHibernateTemplate().get(Order.class, orderno);
		return order;
	}
	
//	查地址表
	public List findShippingbyUser(Integer value){
		String queryString="from Shipping as model where model.user_id='"+value+"'";
		List results=getHibernateTemplate().find(queryString);
		System.out.println(queryString);
		return results;
	}

	//	通过id获取地址实体
	public Shipping findShippingByid(Integer id){
		Shipping shipping=(Shipping)getHibernateTemplate().get(Shipping.class, id);
		return shipping;
	}
}
