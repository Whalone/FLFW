package com.flfw.cart.service.impl;

import java.util.List;

import com.flfw.cart.dao.ShopCartDao;
import com.flfw.cart.service.ShopCartService;

public class ShopCartServiceImpl implements ShopCartService {
	private ShopCartDao shopCartDao;
	
	public ShopCartDao getShopCartDao() {
		return shopCartDao;
	}

	public void setShopCartDao(ShopCartDao shopCartDao) {
		this.shopCartDao = shopCartDao;
	}

	@Override
	public void add(Object object) {
		// TODO Auto-generated method stub
		shopCartDao.save(object);
	}
	@Override
	public List findAllShopCart(int userId){
		return shopCartDao.findAllShopCart(userId);
	}
	public void AddCart_product(int userId,int productId,int quantity){
		shopCartDao.addcartproduct(userId, productId,quantity);
	}
	public void delete_ProductCart(int id){
		shopCartDao.deleteCartProduct(id);
	}
	public void update_ProductCart(int id,int userId,int quantity){
		shopCartDao.updateCartProduct(id,userId,quantity);
	}
}
