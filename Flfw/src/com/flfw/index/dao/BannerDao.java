package com.flfw.index.dao;

import com.flfw.index.model.MmallBanner;

import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 9:38 2018/6/17
 * @Description:
 */
public interface BannerDao {
    //首页轮播图src
    List<MmallBanner> getBannerSrc();
}
