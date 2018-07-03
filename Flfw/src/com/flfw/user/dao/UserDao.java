package com.flfw.user.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.flfw.user.model.MmallUser;


public interface UserDao {
	
	/**
	 * 增加顾客
	 * @param customer
	 * @throws DataAccessException
	 */
	public void save(MmallUser user);
	
	/**
	 * 更新顾客
	 * @param customer
	 */
	public void update(MmallUser user);
	
	/**
	 * 提供两个对象，返回List
	 * @param userName
	 * @param pwd
	 * @return
	 */
	public List findByUserIdPwd(Object userName,Object pwd);
	
	/**
	 * 提供两个字段及字段值（一般是账号，密码），返回List
	 * @param property
	 * @param value
	 * @return
	 */
	public List findByTwoProperty(String property1,String property2,Object value1,Object value2);
	
	/**
	 * 提供一个字段及字段值，返回List
	 * @param property
	 * @param value
	 * @return
	 */
	public List findByOneProperty(String className,String property,Object value);
	
	/**
	 * 查询顾客，返回顾客的实例
	 * 查找顾客名是否存在
	 * @param userName
	 * @return
	 */
	public List findByUserId(Object userName);

	
}
