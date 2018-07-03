package com.flfw.user.service;

import com.flfw.user.model.MmallUser;


public interface UserService {

	/**
	 * 验证登陆
	 * @parma instance
	 */
	public boolean checkLogin(Object value1, Object value2);
	
	/**
	 * 增加顾客
	 * @parma user 顾客对象
	 */
	public void add(MmallUser user);
	
	/**
	 * 更新顾客信息
	 * @param user 顾客对象
	 */
	public void update(MmallUser user);
	
	/**
	 * 传一个顾客名，返回此顾客名的实例
	 * @param name 登录名
	 * @return 顾客对象
	 */
	public MmallUser getUserExample(String name);
	
}
