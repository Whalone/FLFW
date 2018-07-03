package com.flfw.user.controler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.flfw.user.model.MmallUser;
import com.flfw.user.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class loginAciton extends ActionSupport{
	
	//顾客服务对象
	private UserService userService;
	
	//顾客对象
	private MmallUser user;
	
	//用户名
	private String username;
	
	//密码
	private String password;

	
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		//输入密码错误
		if(!userService.checkLogin(getUsername(), getPassword())){
			addActionError("用户名或密码错误");
			if(session.getAttribute("shoppingCart") == null)
				return INPUT;
			else return "orderLoginInput";
		}
		
		//登录成功
		user = userService.getUserExample(getUsername());
		if(user.getRole()==0&&user.getRole()!=null){
			return "admin";
		}else{
			Integer userID = user.getId();
			session.setAttribute("user", user);
			session.setAttribute("nickname", user.getUsername());
			session.setAttribute("userID",userID );
			if(session.getAttribute("shoppingCart") == null)
				return SUCCESS;
			else return "orderLoginSuccess";
		}

		
		
	}
	
	
	
	
	
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public MmallUser getUser() {
		return user;
	}

	public void setUser(MmallUser user) {
		this.user = user;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
