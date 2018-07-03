package com.flfw.index.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 15:15 2018/6/7
 * @Description:
 */
@Entity
@Table(name = "mmall_category", schema = "mmall")
public class MmallCategory {
    private int id;
    private Integer parentId;
    private String name;
    private Byte status;
    private Integer sortOrder;
    private Timestamp createTime;
    private Timestamp updateTime;

    public MmallCategory(){

    }
    public MmallCategory(int id,String name){
        this.id = id;
        this.name = name;
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
    @Column(name = "parent_id", nullable = true)
    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "status", nullable = true)
    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    @Basic
    @Column(name = "sort_order", nullable = true)
    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
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
        MmallCategory that = (MmallCategory) o;
        return id == that.id &&
                Objects.equals(parentId, that.parentId) &&
                Objects.equals(name, that.name) &&
                Objects.equals(status, that.status) &&
                Objects.equals(sortOrder, that.sortOrder) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(updateTime, that.updateTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, parentId, name, status, sortOrder, createTime, updateTime);
    }
}
