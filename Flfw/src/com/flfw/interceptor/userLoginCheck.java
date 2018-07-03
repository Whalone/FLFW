package com.flfw.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class userLoginCheck extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		Map session = invocation.getInvocationContext().getSession();//通过他给的参数获取session
		String nickname = (String) session.get("nickname");//从session里面取username
		if(nickname!=null){  //如果有则继续执行 没有的话 就直接跳到登陆界面
			return invocation.invoke();
		}else if(nickname==null){
			
			return Action.LOGIN;
		}
		return Action.LOGIN;
	}

}
