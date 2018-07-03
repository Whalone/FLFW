package com.flfw.index.dao.hibernate;

import com.flfw.index.dao.ProductsDao;
import com.flfw.index.model.MmallProduct;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 22:09 2018/6/17
 * @Description:
 */
//@Repository("productsDao")
public class ProductsDaoImpl extends HibernateDaoSupport implements ProductsDao {

    private static final Log log = LogFactory.getLog(ProductsDaoImpl.class);
    private static final String tableName = "MmallProduct";

    //@Resource(name="sessionFactory")
//    public void setSessionFactoryDI(SessionFactory sessionFactory) {
//        //调用父类的setSessionFactory方法,注入sessionFactory
//        super.setSessionFactory(sessionFactory);
//    }

    //返回所有商品信息
    public List<MmallProduct> getAllProducts(){
        log.info("查找所有商品...");
        String hql = "From "+tableName+" as model where model.status=1";
        List<MmallProduct> list = getHibernateTemplate().findByExample(new MmallProduct(1),0,10);
//        List<MmallProduct> list = (List<MmallProduct>) getHibernateTemplate().find(hql);
        return list;
    }

    //根据分类id查找该分类下所有有效商品
    public List<MmallProduct> getCategoryProducts(Integer categoryId){
        log.info("查找分类下所有有效商品...");
        List<MmallProduct> list = new ArrayList<>();
        int id = categoryId;
        if(id > 0){
            //list = getHibernateTemplate().findByExample(new MmallProduct(1,categoryId),0,10);
            String hql = "From "+tableName+" as model where model.status=1 and model.categoryId="+id;
            //System.out.println(hql);
            list = (List<MmallProduct>) getHibernateTemplate().find(hql);
            //list = (List<MmallProduct>) getHibernateTemplate().findByExample(new MmallProduct(1,id),0,7);
        }
        return list;
    }

    //根据分类id查找该分类下所有商品
    public List<MmallProduct> adminGetByCategoryId(Integer categoryId){
        log.info("查找分类下所有商品...");
        List<MmallProduct> list = new ArrayList<>();
        int id = categoryId;
        if(id > 0){
            //list = getHibernateTemplate().findByExample(new MmallProduct(1,categoryId),0,10);
            String hql = "From "+tableName+" as model where model.categoryId="+id;
            //System.out.println(hql);
            list = (List<MmallProduct>) getHibernateTemplate().find(hql);
            //list = (List<MmallProduct>) getHibernateTemplate().findByExample(new MmallProduct(1,id),0,7);
        }
        return list;
    }

    //根据商品id返回商品
    public MmallProduct getbyId(Integer productId){
        log.info("根据id查找商品...");
        return getHibernateTemplate().get(MmallProduct.class,productId);
    }

    @Transactional
    public void save(MmallProduct mmallProduct){
        log.info("保存商品...");
        mmallProduct.setCreateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        mmallProduct.setUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        getHibernateTemplate().save(mmallProduct);
    }

    @Transactional
    public void update(MmallProduct mmallProduct){
        log.info("更新商品...");
        MmallProduct product = getHibernateTemplate().get(MmallProduct.class,mmallProduct.getId());
        product.setId(mmallProduct.getId());
        product.setCategoryId(mmallProduct.getCategoryId());
        product.setName(mmallProduct.getName());
        product.setSubtitle(mmallProduct.getSubtitle());
        product.setDetail(mmallProduct.getDetail());
        product.setPriceNow(mmallProduct.getPriceNow());
        product.setPriceOriginal(mmallProduct.getPriceOriginal());
        product.setStock(mmallProduct.getStock());
        product.setUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        getHibernateTemplate().update(product);
    }

    @Transactional
    public void updateStatus(MmallProduct mmallProduct){
        log.info("更新状态");
        MmallProduct product = getHibernateTemplate().get(MmallProduct.class,mmallProduct.getId());
        product.setUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        product.setStatus(mmallProduct.getStatus());
        getHibernateTemplate().update(product);
    }

    @Transactional
    public void productSell(MmallProduct mmallProduct){
        log.info("更新销量");
        MmallProduct product = getHibernateTemplate().get(MmallProduct.class,mmallProduct.getId());
        product.setUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        product.setSellNumber(mmallProduct.getSellNumber());
        getHibernateTemplate().update(product);
    }
}
