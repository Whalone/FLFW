package com.flfw.index.model;

import java.sql.Timestamp;
import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 9:17 2018/6/13
 * @Description:
 */
public class CategoryList {
    private int id;
    private Integer parentId;
    private String name;
    private Byte status;
    private Integer sortOrder;
    private Timestamp createTime;
    private Timestamp updateTime;
    private List<MmallCategory> childList;

    public CategoryList(){

    }
    public CategoryList(int id,String name,List<MmallCategory> childList){
        this.id = id;
        this.name = name;
        this.childList = childList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public List<MmallCategory> getChildList() {
        return childList;
    }

    public void setChildList(List<MmallCategory> childList) {
        this.childList = childList;
    }
}
