package com.flfw.index.dao.hibernate;

import com.flfw.index.dao.BannerDao;
import com.flfw.index.model.MmallBanner;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 9:41 2018/6/17
 * @Description:
 */
//@Repository("bannerDao")
public class BannerDaoImpl extends HibernateDaoSupport implements BannerDao{

    private static final Log log = LogFactory.getLog(BannerDaoImpl.class);
    private static final String tableName = "MmallBanner";

    //@Resource(name="sessionFactory")
//    public void setSessionFactoryDI(SessionFactory sessionFactory) {
//        //调用父类的setSessionFactory方法,注入sessionFactory
//        super.setSessionFactory(sessionFactory);
//    }

    //查询轮播图src
    public List<MmallBanner> getBannerSrc(){
        log.info("查找轮播图src");
        //String hql = "From "+tableName+" as model where model.status=1 and";
        List<MmallBanner> list = getHibernateTemplate().findByExample(new MmallBanner(1),0,4 );
        return list;
    }
}
