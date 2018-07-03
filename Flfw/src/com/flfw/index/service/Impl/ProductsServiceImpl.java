package com.flfw.index.service.Impl;

import com.flfw.index.dao.ProductsDao;
import com.flfw.index.model.MmallProduct;
import com.flfw.index.model.Product;
import com.flfw.index.model.ProductsList;
import com.flfw.index.service.CategoryService;
import com.flfw.index.service.ProductsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 22:23 2018/6/17
 * @Description:
 */
//@Service("productsService")
public class ProductsServiceImpl extends BaseServiceImpl<MmallProduct> implements ProductsService {
    //@Resource
    private ProductsDao productsDao;
    //@Resource
    private CategoryService categoryService;

    public void setProductsDao(ProductsDao productsDao) {
        this.productsDao = productsDao;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    private String mainImgUrl = "./images/products/main/";
    private String subImgUrl = "./images/products/sub/";


    //返回所有商品
    public List<ProductsList> getAllProducts(){
        return null;
    }

    //返回第一子分类的所有商品
    public List<ProductsList> getCategoryFirstAllProducts(){
        List<Integer>list = categoryService.getParentFirstChildId();
        List<ProductsList> productList = new ArrayList<>();

        for (Iterator iterator = list.iterator();iterator.hasNext();){
            Integer id = (Integer) iterator.next();
            if (id==0){
                productList.add(new ProductsList(id));
            }else{
                List<MmallProduct> products = this.getCategoryProducts(id);
                productList.add(new ProductsList(id,products));
            }
        }
        return productList;
    }

    //根据分类id查找该分类下所有商品
    public List<MmallProduct> getCategoryProducts(Integer categoryId){
        List<MmallProduct> tempList= productsDao.getCategoryProducts(categoryId);
        List<MmallProduct> productList = new ArrayList<>();
        MmallProduct product,temp;
        for (Iterator iterator = tempList.iterator();iterator.hasNext();){
            temp = (MmallProduct) iterator.next();
            product = new MmallProduct(temp.getId(),temp.getCategoryId(),temp.getName(),temp.getSubtitle(),
                    mainImgUrl+temp.getMainImage(),subImgUrl+temp.getSubImages(),temp.getDetail(),
                    temp.getPriceOriginal(),temp.getStock(),temp.getPriceNow(),temp.getSellNumber(),temp.getDetailImage());
            productList.add(product);
        }
        return productList;
    }

    //
    public MmallProduct get(int productID){
        return productsDao.getbyId(productID);
    }

    //根据商品id返回商品
    public Product getbyId(Integer productId){
        MmallProduct temp = productsDao.getbyId(productId);
        List<String> imgList = new ArrayList<>();

        String url = temp.getSubImages()+"";
        String pattern = "((\\w+).jpg)|((\\w+).jpeg)|((\\w+).png)";
        Pattern p = Pattern.compile(pattern);
        Matcher matcher = p.matcher(url);
        if(matcher.groupCount()==0){
                imgList.add("");
        }else{
            while(matcher.find()){
                imgList.add(subImgUrl+matcher.group());
            }
        }
        Product product = new Product(temp.getId(),temp.getCategoryId(),temp.getName(),temp.getSubtitle(),
                mainImgUrl+temp.getMainImage(),imgList,temp.getDetail(),
                temp.getPriceOriginal(),temp.getStock(),temp.getStatus(),temp.getPriceNow(),temp.getSellNumber(),temp.getDetailImage());
        return product;
    }

    //管理员按分类id查找商品
    public List<MmallProduct> adminCategoryProduct(Integer categoryId){
        return productsDao.adminGetByCategoryId(categoryId);
    }

    //保存商品
    public void productSave(MmallProduct mmallProduct){
        mmallProduct.setMainImage("null");
        mmallProduct.setSubImages("null");
        mmallProduct.setDetailImage("null");
        mmallProduct.setStatus(0);
        mmallProduct.setSellNumber(0);
        productsDao.save(mmallProduct);
    }

    //更新商品
    public void productUpdate(MmallProduct mmallProduct){
        mmallProduct.setSubImages("null");
        productsDao.update(mmallProduct);
    }

    //更新状态
    public void updateStatus(int id){
        MmallProduct product = this.get(id);
        if (product.getStatus()==1){
            product.setStatus(0);
        }else if (product.getStatus()==0){
            product.setStatus(1);
        }
        productsDao.updateStatus(product);
    }

    //销量修改
    public void productSell(int id,int number){
        MmallProduct product = this.get(id);
        product.setSellNumber(product.getSellNumber()+number);
        productsDao.productSell(product);
    }

}
