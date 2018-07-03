package com.flfw.cart.dao;

import java.util.List;

import com.flfw.cart.model.MmallCart;

public interface ShopCartDao {
	public void save(Object object);
	public List findAllShopCart(int userId);
	public void addcartproduct(int userId,int productId,int quantity);
	public void deleteCartProduct(int id);
	public void updateCartProduct(int id,int userId,int quantity);
}
