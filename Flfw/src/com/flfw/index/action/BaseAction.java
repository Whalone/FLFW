package com.flfw.index.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.ParameterizedType;
import java.util.Map;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 14:43 2018/6/12
 * @Description:
 */
@Controller("baseAction")
@Scope("prototype")
public class BaseAction<T> extends ActionSupport implements RequestAware,SessionAware,ServletResponseAware,ApplicationAware,ModelDriven<T> {
    protected Map<String, Object> request;
    protected Map<String, Object> session;
    protected Map<String, Object> application;
    protected HttpServletResponse servletResponse;


    protected T model;


    @Override
    public void setApplication(Map<String, Object> application) {
        this.application = application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    @Override
    public void setServletResponse(HttpServletResponse servletResponse){
        this.servletResponse = servletResponse;
    }

    @Override
    public T getModel() { //这里通过解析传进来的T来new一个对应的instance
        ParameterizedType type = (ParameterizedType)this.getClass().getGenericSuperclass();
        Class clazz = (Class)type.getActualTypeArguments()[0];
        try {
            model = (T)clazz.newInstance();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return model;
    }

}
