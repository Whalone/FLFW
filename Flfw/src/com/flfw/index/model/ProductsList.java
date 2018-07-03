package com.flfw.index.model;

import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 16:41 2018/6/18
 * @Description:
 */
public class ProductsList {
    private int id;
    private String name;
    private List<MmallProduct> products;

    public ProductsList(){}

    public ProductsList(int id){
        this.id = id;;
    }

    public ProductsList(int id,List<MmallProduct> products){
        this.id = id;
        this.products = products;
    }

    public ProductsList(int id, String name, List<MmallProduct> products) {
        this.id = id;
        this.name = name;
        this.products = products;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<MmallProduct> getProducts() {
        return products;
    }

    public void setProducts(List<MmallProduct> products) {
        this.products = products;
    }
}
