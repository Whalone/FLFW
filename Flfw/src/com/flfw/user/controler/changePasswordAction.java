package com.flfw.user.controler;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;

import com.flfw.user.model.MmallUser;
import com.flfw.user.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class changePasswordAction extends ActionSupport{
	
	//服务对象
	private UserService userService;
	//传进来的旧密码
	private String oldPassword;
	//传进来的新密码
	private String newPassword1;
	//传进来的确认密码
	private String newPassword2;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword1() {
		return newPassword1;
	}
	public void setNewPassword1(String newPassword1) {
		this.newPassword1 = newPassword1;
	}
	public String getNewPassword2() {
		return newPassword2;
	}
	public void setNewPassword2(String newPassword2) {
		this.newPassword2 = newPassword2;
	}
	
	public void validate(){
		if(oldPassword.equals("")){
			addFieldError("oldPassword", "请输入密码！");
		}else if(newPassword1.equals("")){
			addFieldError("newPassword1", "请输入新密码！");
		}else if(!newPassword1.equals(newPassword2)){
			addFieldError("newPassword1", "新密码与确认密码不一致！");
		}
	}
	
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		MmallUser user = (MmallUser) session.getAttribute("user");
		//验证旧密码失败
		if(!oldPassword.equals(user.getPassword())){
			addActionError("原密码不正确！");
			return INPUT;
		}
		//验证旧密码成功
		user.setPassword(newPassword1);
		/*获取当前时间*/
		Timestamp time = new Timestamp(System.currentTimeMillis());//数据库用的是timestamp类型
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//规定格式
		String timeStr = df.format(time);  //获取字符串 
		time = Timestamp.valueOf(timeStr); //把字符串转换成timestamp
		user.setUpdateTime(time);
		userService.update(user);
		return SUCCESS;
		
	}
	
	
}
