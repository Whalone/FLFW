package com.flfw.index.dao;

import com.flfw.index.model.MmallProduct;

import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 22:08 2018/6/17
 * @Description:
 */
public interface ProductsDao {
    //返回所有商品信息
    List<MmallProduct> getAllProducts();

    //根据分类id查找该分类下所有分类
    List<MmallProduct> getCategoryProducts(Integer categoryId);

    //根据商品id返回商品
    MmallProduct getbyId(Integer productId);

    //根据分类id查找该分类下所有商品
    List<MmallProduct> adminGetByCategoryId(Integer categoryId);

    //保存商品
    void save(MmallProduct mmallProduct);

    //保存商品
    void update(MmallProduct mmallProduct);

    void updateStatus(MmallProduct mmallProduct);

    void productSell(MmallProduct mmallProduct);
}
