package com.flfw.index.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 14:01 2018/6/21
 * @Description:
 */
public class Product {
    private int id;
    private int categoryId;
    private String name;
    private String subtitle;
    private String mainImage;
    private List<String> subImages;
    private String detail;
    private BigDecimal priceOriginal;
    private int stock;
    private Integer status;
    private BigDecimal priceNow;
    private Integer sellNumber;
    private String detailImage;

    public Product(){

    }

    public Product(int id, int categoryId, String name, String subtitle, String mainImage, List<String> subImages, String detail, BigDecimal priceOriginal, int stock, int status, BigDecimal priceNow, Integer sellNumber,String detailImage) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.subtitle = subtitle;
        this.mainImage = mainImage;
        this.subImages = subImages;
        this.detail = detail;
        this.priceOriginal = priceOriginal;
        this.stock = stock;
        this.status = status;
        this.priceNow = priceNow;
        this.sellNumber = sellNumber;
        this.detailImage = detailImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public List<String> getSubImages() {
        return subImages;
    }

    public void setSubImages(List<String> subImages) {
        this.subImages = subImages;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public BigDecimal getPriceOriginal() {
        return priceOriginal;
    }

    public void setPriceOriginal(BigDecimal priceOriginal) {
        this.priceOriginal = priceOriginal;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public BigDecimal getPriceNow() {
        return priceNow;
    }

    public void setPriceNow(BigDecimal priceNow) {
        this.priceNow = priceNow;
    }

    public Integer getSellNumber() {
        return sellNumber;
    }

    public void setSellNumber(Integer sellNumber) {
        this.sellNumber = sellNumber;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDetailImage() {
        return detailImage;
    }

    public void setDetailImage(String detailImage) {
        this.detailImage = detailImage;
    }
}
