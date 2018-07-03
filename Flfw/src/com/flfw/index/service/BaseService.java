package com.flfw.index.service;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 16:26 2018/6/12
 * @Description:
 */
public interface BaseService<T> {
    void save(T t);

    void update(T t);

    void delete(int id);

    T get(int id);
}
