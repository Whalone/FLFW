package com.flfw.cart.model;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class Mmallproduct {
	private Integer id;
	private Integer category_id;
	private String name;
	private String subtitle;
	private String main_image;
	private String detail;
	private String sub_images;
	private BigDecimal price_original;
	private Integer stock;
	private Integer status;
	private Timestamp create_time;
	private Timestamp update_time;
	private BigDecimal price_now;
	private Integer sell_number;
	private String detail_image;
	public String getDetail_image() {
		return detail_image;
	}
	public void setDetail_image(String detail_image) {
		this.detail_image = detail_image;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
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
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getSub_images() {
		return sub_images;
	}
	public void setSub_images(String sub_images) {
		this.sub_images = sub_images;
	}
	public BigDecimal getPrice_original() {
		return price_original;
	}
	public void setPrice_original(BigDecimal price_original) {
		this.price_original = price_original;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public Timestamp getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}
	public BigDecimal getPrice_now() {
		return price_now;
	}
	public void setPrice_now(BigDecimal price_now) {
		this.price_now = price_now;
	}
	public Integer getSell_number() {
		return sell_number;
	}
	public void setSell_number(Integer sell_number) {
		this.sell_number = sell_number;
	}
	
}
