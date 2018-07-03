package com.flfw.index.service.Impl;

import com.flfw.index.service.BaseService;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 16:28 2018/6/12
 * @Description:
 */
//@Service("baseServiceImpl")
//@Lazy()
public class BaseServiceImpl<T> implements BaseService<T> {
    private Class aClass;

    public BaseServiceImpl(){
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        aClass = (Class)type.getActualTypeArguments()[0];
    }

    @Override
    public void save(T t) {

    }

    @Override
    public void update(T t) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public T get(int id) {

        return null;
    }
}
