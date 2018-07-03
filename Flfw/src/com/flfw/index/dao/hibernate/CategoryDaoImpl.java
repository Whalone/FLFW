package com.flfw.index.dao.hibernate;

import com.flfw.index.dao.CategoryDao;
import com.flfw.index.model.MmallCategory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 15:19 2018/6/7
 * @Description:
 */
//@Repository("categoryDao")
public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao{

    private static final Log log = LogFactory.getLog(CategoryDaoImpl.class);
    private static final String tableName = "MmallCategory";

//    @Resource(name="sessionFactory")
//    public void setSessionFactoryDI(SessionFactory sessionFactory) {
//        //调用父类的setSessionFactory方法,注入sessionFactory
//        super.setSessionFactory(sessionFactory);
//    }

//    查询所有父亲商品分类
    public List<MmallCategory> getAllParentCategory(){
        log.info("查找父亲商品分类...");
        String hql = "From "+tableName+" as model where model.parentId=0 and model.status=1 order by model.id asc ";
        List<MmallCategory> list = (List<MmallCategory>)getHibernateTemplate().find(hql);
        return list;
    }
//    查询子分类by父分类id
    public List<MmallCategory> getChildCategoryByParentId(int id){
        log.info("查找子分类by父分类id...");
        String hql = "from "+tableName+" as model where model.parentId="+id+"and model.status=1 order by model.id asc";
        List<MmallCategory> list = (List<MmallCategory>)getHibernateTemplate().find(hql);
        return list;
    }
}
