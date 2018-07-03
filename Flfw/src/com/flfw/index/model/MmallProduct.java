package com.flfw.index.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Objects;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 16:11 2018/6/21
 * @Description:
 */
@Entity
@Table(name = "mmall_product", schema = "mmall")
public class MmallProduct {
    private int id;
    private int categoryId;
    private String name;
    private String subtitle;
    private String mainImage;
    private String subImages;
    private String detail;
    private BigDecimal priceOriginal;
    private int stock;
    private Integer status;
    private Timestamp createTime;
    private Timestamp updateTime;
    private BigDecimal priceNow;
    private Integer sellNumber;
    private String detailImage;


    public MmallProduct(){

    }

    public MmallProduct(int status){
        this.status = status;
    }

    public MmallProduct(int status,int categoryId){
        this.status = status;
        this.categoryId = categoryId;
    }


    public MmallProduct(int id, int categoryId, String name, String subtitle, String mainImage, String subImages, String detail, BigDecimal priceOriginal, int stock, BigDecimal priceNow, Integer sellNumber,String detailImage) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.subtitle = subtitle;
        this.mainImage = mainImage;
        this.subImages = subImages;
        this.detail = detail;
        this.priceOriginal = priceOriginal;
        this.stock = stock;
        this.priceNow = priceNow;
        this.sellNumber = sellNumber;
        this.detailImage = detailImage;
    }

    public MmallProduct(int id, int categoryId, String name, String subtitle, String mainImage, String subImages, String detail, BigDecimal priceOriginal, int stock, Integer status, Timestamp createTime, Timestamp updateTime, BigDecimal priceNow, Integer sellNumber, String detailImage) {
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
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.priceNow = priceNow;
        this.sellNumber = sellNumber;
        this.detailImage = detailImage;
    }

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "category_id", nullable = false)
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 100)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "subtitle", nullable = true, length = 255)
    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    @Basic
    @Column(name = "main_image", nullable = true, length = 500)
    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    @Basic
    @Column(name = "sub_images", nullable = true, length = -1, updatable = false)
    public String getSubImages() {
        return subImages;
    }

    public void setSubImages(String subImages) {
        this.subImages = subImages;
    }

    @Basic
    @Column(name = "detail", nullable = true, length = -1)
    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Basic
    @Column(name = "price_original", nullable = false, precision = 2)
    public BigDecimal getPriceOriginal() {
        return priceOriginal;
    }

    public void setPriceOriginal(BigDecimal priceOriginal) {
        this.priceOriginal = priceOriginal;
    }

    @Basic
    @Column(name = "stock", nullable = false)
    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Basic
    @Column(name = "status", nullable = true)
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Basic
    @Column(name = "create_time", nullable = false, updatable = false)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "update_time", nullable = true)
    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "price_now", nullable = false, precision = 2)
    public BigDecimal getPriceNow() {
        return priceNow;
    }

    public void setPriceNow(BigDecimal priceNow) {
        this.priceNow = priceNow;
    }

    @Basic
    @Column(name = "sell_number", nullable = true)
    public Integer getSellNumber() {
        return sellNumber;
    }

    public void setSellNumber(Integer sellNumber) {
        this.sellNumber = sellNumber;
    }

    @Basic
    @Column(name = "detail_image", nullable = true, length = -1)
    public String getDetailImage() {
        return detailImage;
    }

    public void setDetailImage(String detailImage) {
        this.detailImage = detailImage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MmallProduct product = (MmallProduct) o;
        return id == product.id &&
                categoryId == product.categoryId &&
                stock == product.stock &&
                Objects.equals(name, product.name) &&
                Objects.equals(subtitle, product.subtitle) &&
                Objects.equals(mainImage, product.mainImage) &&
                Objects.equals(subImages, product.subImages) &&
                Objects.equals(detail, product.detail) &&
                Objects.equals(priceOriginal, product.priceOriginal) &&
                Objects.equals(status, product.status) &&
                Objects.equals(createTime, product.createTime) &&
                Objects.equals(updateTime, product.updateTime) &&
                Objects.equals(priceNow, product.priceNow) &&
                Objects.equals(sellNumber, product.sellNumber) &&
                Objects.equals(detailImage, product.detailImage);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, categoryId, name, subtitle, mainImage, subImages, detail, priceOriginal, stock, status, createTime, updateTime, priceNow, sellNumber, detailImage);
    }
}
