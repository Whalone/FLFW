package com.flfw.index.service;

import com.flfw.index.model.MmallProduct;
import com.flfw.index.model.Product;
import com.flfw.index.model.ProductsList;

import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 22:19 2018/6/17
 * @Description:
 */
public interface ProductsService extends BaseService<MmallProduct>{
    //返回所有商品分类
    List<ProductsList> getAllProducts();

    //返回第一分类下所有商品
    List<ProductsList> getCategoryFirstAllProducts();

    //根据分类id查找该分类下所有商品
    List<MmallProduct> getCategoryProducts(Integer categoryId);

    MmallProduct get(int productID);

    //根据商品id返回商品
    Product getbyId(Integer productId);

    //管理员按分类id查找商品
    List<MmallProduct> adminCategoryProduct(Integer categoryId);

    //保存商品
    void productSave(MmallProduct mmallProduct);

    //更新商品
    void productUpdate(MmallProduct mmallProduct);

    //更新状态
    void updateStatus(int id);

    //销量修改
    void productSell(int id,int number);
}
