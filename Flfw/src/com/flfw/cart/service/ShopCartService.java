package com.flfw.cart.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

public interface ShopCartService {
	@Transactional
	public void add(Object object);
	@Transactional
	public List findAllShopCart(int userId);
	@Transactional
	public void AddCart_product(int userId,int productId,int quantity);
	@Transactional
	public void delete_ProductCart(int id);
	@Transactional
	public void update_ProductCart(int id,int userId,int quantity);
}
