package com.flfw.index.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 9:38 2018/6/17
 * @Description:
 */
@Entity
@Table(name = "mmall_banner", schema = "mmall")
public class MmallBanner {
    private int id;
    private String imgSrc;
    private int status;
    private Timestamp createTime;
    private Timestamp updateTime;

    public MmallBanner(){

    }
    public MmallBanner(int status){
        this.status = status;
    }
    public MmallBanner(int id,String imgSrc){
        this.id = id;
        this.imgSrc = imgSrc;
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
    @Column(name = "img_src", nullable = false, length = 255)
    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    @Basic
    @Column(name = "status", nullable = false)
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Basic
    @Column(name = "create_time", nullable = true)
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MmallBanner that = (MmallBanner) o;
        return id == that.id &&
                status == that.status &&
                Objects.equals(imgSrc, that.imgSrc) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(updateTime, that.updateTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, imgSrc, status, createTime, updateTime);
    }
}
