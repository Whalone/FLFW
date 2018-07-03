package com.flfw.user.controler;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.flfw.user.model.MmallUser;
import com.flfw.user.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class updateAction extends ActionSupport{
	
	//顾客服务对象
	private UserService userService;
	
	private String nickname;
	
	private String phone;
	
	private String email;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void validate(){
		if(nickname.equals("")){
			addFieldError("nickname", "昵称不能为空！");
		}else if(!phone.equals("")){
			String regexPhone ="^((13[0-9])|(15[0-9])|(18[0-9]))\\d{8}$";//使用正则表达式
			Pattern pattern1 = Pattern.compile(regexPhone,Pattern.CASE_INSENSITIVE);//声明pattern正则表达式对象
			Matcher matcher1 = pattern1.matcher(phone);//把手机号放进去验证
			if(!matcher1.matches()){
				addFieldError("phone", "手机号码格式不合法！");
			}
		}else if(!email.equals("")){
			String regexEmail = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern pattern2 = Pattern.compile(regexEmail,Pattern.CASE_INSENSITIVE);//声明pattern正则表达式对象
			Matcher matcher2 = pattern2.matcher(email);//把手机号放进去验证
			if(!matcher2.matches()){
				addFieldError("email", "邮箱格式不合法！");
			}
		}
	}


	
	public String execute() throws Exception{
		System.out.println("zhixing execute");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		MmallUser user = (MmallUser) session.getAttribute("user");
		user.setNickname(getNickname());
		user.setPhone(getPhone());
		user.setEmail(getEmail());
		Timestamp time = new Timestamp(System.currentTimeMillis());//数据库用的是timestamp类型
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//规定格式
		String timeStr = df.format(time);  //获取字符串 
		time = Timestamp.valueOf(timeStr); //把字符串转换成timestamp
		user.setUpdateTime(time);
		userService.update(user);
		return SUCCESS;
	}
}
