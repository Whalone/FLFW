package com.flfw.index.service.Impl;

import com.flfw.index.dao.BannerDao;
import com.flfw.index.model.MmallBanner;
import com.flfw.index.service.BannerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 10:14 2018/6/17
 * @Description:
 */
//@Service("bannerService")

public class BannerServiceImpl extends BaseServiceImpl<MmallBanner> implements BannerService {
    //@Resource
    private BannerDao bannerDao;
    private String imgSrc = "./images/banner/";

    public void setBannerDao(BannerDao bannerDao) {
        this.bannerDao = bannerDao;
    }

    public List<String> getBannerSrc(){
        List<MmallBanner> bannerslist = bannerDao.getBannerSrc();
        List<String> bannerSrc = new ArrayList<>();
        for(Iterator iterator = bannerslist.iterator();iterator.hasNext();){
            MmallBanner banner = (MmallBanner)iterator.next();
            bannerSrc.add(imgSrc+banner.getImgSrc());
        }
        return bannerSrc;
    }
}
