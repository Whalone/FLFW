package com.flfw.user.controler;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;

import com.flfw.user.model.MmallUser;
import com.flfw.user.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

import javassist.expr.NewArray;

public class registerAction extends ActionSupport{
	//顾客对象
	private MmallUser user;
	//服务对象
	private UserService userService;
	//登录名
	private String username;
	//登陆密码
	private String password1;
	//确认密码
	private String password2;
	public MmallUser getUser() {
		return user;
	}
	public void setUser(MmallUser user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	public void validate(){
		if(username.equals("")){
			addFieldError("username","账号不能为空！");
		}else if(username.length()>16){
			addFieldError("username","账号长度过长！");
		}else if(password1.equals("")){
			addFieldError("password1","密码不能为空！");
		}else if(!password1.equals(password2)){
			addFieldError("password1","密码与确认密码不一致！");
		}
	}
	
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();//获取session
		user.setUsername(username);
		user.setNickname(username);
		user.setPassword(password1);
		/*获取当前时间*/
		Timestamp time = new Timestamp(System.currentTimeMillis());//数据库用的是timestamp类型
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//规定格式
		String timeStr = df.format(time);  //获取字符串 
		time = Timestamp.valueOf(timeStr); //把字符串转换成timestamp
		user.setUpdateTime(time);
		user.setCreateTime(time);
		userService.add(user);
		session.setAttribute("user", user);
		session.setAttribute("nickname",getUsername());
		return SUCCESS;
	}
	
	
	
}
