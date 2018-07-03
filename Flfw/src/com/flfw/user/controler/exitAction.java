package com.flfw.user.controler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class exitAction extends ActionSupport{
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("userID");
		session.removeAttribute("username");
		session.removeAttribute("nickname");
		return SUCCESS;
	}
}
