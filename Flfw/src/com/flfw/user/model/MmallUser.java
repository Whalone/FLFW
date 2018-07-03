package com.flfw.user.model;

import java.sql.Timestamp;

/**
 * MmallUser entity. @author MyEclipse Persistence Tools
 */

public class MmallUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String email;
	private String phone;
	private Integer role;
	private Timestamp createTime;
	private Timestamp updateTime;
	private String nickname;

	// Constructors

	/** default constructor */
	public MmallUser() {
	}

	/** minimal constructor */
	public MmallUser(String username, String password, Timestamp createTime, Timestamp updateTime) {
		this.username = username;
		this.password = password;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	/** full constructor */
	public MmallUser(String username, String password, String email, String phone,
			Integer role, Timestamp createTime, Timestamp updateTime, String nickname) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.role = role;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.nickname = nickname;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getRole() {
		return this.role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}