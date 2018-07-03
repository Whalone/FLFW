package com.flfw.user.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.flfw.user.dao.UserDao;
import com.flfw.user.model.MmallUser;
import com.flfw.user.service.UserService;

@Transactional
public class UserServiceImpl implements UserService {
	UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	public boolean checkLogin(Object value1, Object value2) {
		List list = userDao.findByUserIdPwd(value1, value2);
        //登陆失败
		if(list.isEmpty()){
			return false;
		}
		
		else return true; 
		//登陆成功
	}

	
	public void add(MmallUser user) {
		userDao.save(user);

	}


	public void update(MmallUser user){
		userDao.update(user);
	}

	public MmallUser getUserExample(String name) {
		MmallUser user = (MmallUser) userDao.findByUserId(name).get(0);
		return user;
	}




}
